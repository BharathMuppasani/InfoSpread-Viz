from flask import Flask, request, jsonify
from flask_cors import CORS
import networkx as nx
import random
import re

from script.pddl_functions import create_pddl_file, run_planner

import ndlib.models.ModelConfig as mc
import ndlib.models.opinions as op

app = Flask(__name__)
CORS(app)

def nodes_links_to_graph(nodes, links):
    G = nx.Graph()
    for node in nodes:
        opinions = {k: v for k, v in node.items() if k.startswith("opinion_")}
        G.add_node(node["id"], **opinions)
    for link in links:
        G.add_edge(link["source"], link["target"])
    return G

def graph_to_nodes_links(G):
    nodes = [{"id": node, **data} for node, data in G.nodes(data=True)]
    links = [{"source": u, "target": v} for u, v in G.edges()]
    return nodes, links

def generate_data(num_agents, num_source_nodes, connection_type, num_topics):

    nodes = [{"id": i, **{f"opinion_{t}": (2 * random.random()) - 1 for t in range(num_topics)}} for i in range(num_agents)]
    # nodes = [{"id": i, **{f"opinion_{t}": 0 for t in range(num_topics)}} for i in range(num_agents)]
    
    # Assign the 'type' attribute based on num_source_nodes
    for i in range(num_agents):
        nodes[i]['type'] = 'Agent'
    
    for i in range(num_source_nodes):
        temp_idx = random.randint(0, num_agents-1)
        nodes[temp_idx]['type'] = 'Source'
        for t in range(num_topics):
            nodes[temp_idx][f"opinion_{t}"] = 1
    
    links = []

    if connection_type == "fullyConnected":
        for i in range(num_agents):
            for j in range(i+1, num_agents):
                links.append({"source": i, "target": j})
    elif connection_type == "random":
        for i in range(num_agents):
            target = random.randint(0, num_agents-1)
            if target != i:
                links.append({"source": i, "target": target})
    elif connection_type == "smallWorld":
        # Creating a small-world network using Watts-Strogatz model
        k = 4  # Number of nearest neighbors in ring topology
        p = 0.1  # Probability of rewiring each edge
        G = nx.watts_strogatz_graph(num_agents, k, p)
        for (i, j) in G.edges():
            links.append({"source": i, "target": j})
    elif connection_type == "erdosRenyi":
        p = 0.05  # Example probability for edge creation
        G = nx.erdos_renyi_graph(num_agents, p)
        for (i, j) in G.edges():
            links.append({"source": i, "target": j})
    elif connection_type == "scaleFree":
        m = 2  # Number of edges to attach from a new node to existing nodes
        G = nx.barabasi_albert_graph(num_agents, m)
        for (i, j) in G.edges():
            links.append({"source": i, "target": j})

    return nodes, links

def update_opinions(nodes, links, iterations=10, selected_topic=0):
    # Convert links to an adjacency list format for easier neighbor look-up
    adjacency_list = {i: [] for i in range(len(nodes))}
    for link in links:
        adjacency_list[link["source"]].append(link["target"])
        adjacency_list[link["target"]].append(link["source"])

    # Iterate and update opinions
    for _ in range(iterations):
        new_opinions = {}
        for node in nodes:
            neighbors = adjacency_list[node["id"]]
            if neighbors:  # Ensure the node has neighbors
                average_neighbor_opinion = sum(nodes[neighbor][f"opinion_{selected_topic}"] for neighbor in neighbors) / len(neighbors)
                new_opinions[node["id"]] = average_neighbor_opinion
        for node_id, new_opinion in new_opinions.items():
            nodes[node_id][f"opinion_{selected_topic}"] = new_opinion

    return nodes

def voter_model_update(nodes, links, iterations=10, selected_topic=0):
    # Create an adjacency list for the graph
    adjacency_list = {node["id"]: [] for node in nodes}
    for link in links:
        adjacency_list[link["source"]].append(link["target"])
        adjacency_list[link["target"]].append(link["source"])

    # Perform opinion updates for the specified number of iterations
    for _ in range(iterations):
        # Randomly select a node
        selected_node = random.choice(nodes)
        if not adjacency_list[selected_node["id"]]:  # If the node has no neighbors, skip this iteration
            continue

        # Randomly select a neighbor of the chosen node
        neighbor = random.choice(adjacency_list[selected_node["id"]])

        # The selected node adopts the opinion of its neighbor
        for node in nodes:
            if node["id"] == selected_node["id"]:
                node[f"opinion_{selected_topic}"] = next(n[f"opinion_{selected_topic}"] for n in nodes if n["id"] == neighbor)

    return nodes

# Implementing the HK model using ndlib

def hegselmann_krause_ndlib(nodes, links, epsilon=0.32, iterations=10, selected_topic=0):
    
    # Convert nodes and links to a NetworkX graph
    G = nodes_links_to_graph(nodes, links)
    
    # Step 1: Save opinions of other topics
    saved_opinions = {}
    for node in G.nodes(data=True):
        saved_opinions[node[0]] = {k: v for k, v in node[1].items() if k != f"opinion_{selected_topic}"}
    
    # Model selection
    model = op.HKModel(G)
    
    # Model Configuration
    config = mc.Configuration()
    config.add_model_parameter("epsilon", epsilon)
    model.set_initial_status(config)
    
    # Simulation execution
    iterations = model.iteration_bunch(iterations)
    
    for iteration in iterations:
        for node, status in iteration['status'].items():
            G.nodes[node][f"opinion_{selected_topic}"] = status
    
    # Step 3: Restore saved opinions
    for node_id, opinions in saved_opinions.items():
        for key, value in opinions.items():
            G.nodes[node_id][key] = value
    
    nodes, links = graph_to_nodes_links(G)
    return nodes

def new_opinion_model_update_v2(nodes, links, iterations, num_topics):
    G = nodes_links_to_graph(nodes, links)
    
    for _ in range(iterations):
        # Identify source nodes
        source_nodes = [node for node, data in G.nodes(data=True) if data.get('type') == 'Source']
        
        # Randomly select a subset of source nodes to propagate their opinions
        sources_to_propagate = random.sample(source_nodes, random.randint(0, len(source_nodes)))
        
        for source in sources_to_propagate:
            # Randomly select a topic to propagate
            selected_topic = random.randint(0, num_topics-1)
            opinion_key = f"opinion_{selected_topic}"
            
            # Propagate this topic's opinion to connected agents
            neighbors = list(G.neighbors(source))
            for neighbor in neighbors:
                # Do not update opinions on the source
                if G.nodes[neighbor].get('type') != 'Source':
                    G.nodes[neighbor][opinion_key] = G.nodes[source][opinion_key]
        
        # Randomly select a subset of agents to propagate their opinions
        agents = [node for node, data in G.nodes(data=True) if data.get('type') != 'Source']
        agents_to_propagate = random.sample(agents, random.randint(0, len(agents)))
        
        for agent in agents_to_propagate:
            selected_topic = random.randint(0, num_topics-1)
            opinion_key = f"opinion_{selected_topic}"
            
            # Randomly select a neighbor to propagate the opinion
            neighbors = list(G.neighbors(agent))
            if neighbors:  # Check if the agent has neighbors
                target = random.choice(neighbors)
                G.nodes[target][opinion_key] = G.nodes[agent][opinion_key]
                
    # Convert the graph back to nodes and links for frontend
    nodes, _ = graph_to_nodes_links(G)
    return nodes

# As before, to integrate this with the Flask app:


@app.route('/update_opinions', methods=['POST'])
def update_opinions_endpoint():
    data = request.json
    nodes = data['nodes']
    links = data['links']
    for link in links:
        link["source"] = link["source"]["id"]
        link["target"] = link["target"]["id"]
    model_type = data['modelType']
    iterations = int(data.get('iterations', 10))
    selected_topic = int(data.get("selectedTopic"))
    num_topics = int(data.get("numTopics"))
    dependencyMatrix = data.get("dependencyMatrix")


    if model_type == "basicOpinion":
        nodes = update_opinions(nodes, links, iterations, selected_topic)
    elif model_type == "voterModel":
        nodes = voter_model_update(nodes, links, iterations, selected_topic)
    elif model_type == "hegselmannKrause":
        nodes = hegselmann_krause_ndlib(nodes, links, iterations, selected_topic)
    elif model_type == "newOpinionModel":
        nodes = new_opinion_model_update_v2(nodes, links, iterations, num_topics)

    # ... handle other models here ...

    return jsonify(nodes=nodes)


def extract_id_from_string(s):
    result = re.search(r'\d+', s)
    return int(result.group()) if result else None

@app.route('/execute_plan', methods=['POST'])
def execute_plan_steps():
    data = request.json
    nodes = data['nodes']
    links = data['links']
    current_plan_step = data['currentStep']
    
    spread_node_id = extract_id_from_string(current_plan_step.split(' ')[-2])
    topic = extract_id_from_string(current_plan_step.split(' ')[-1])
    
    # Find the spreading node
    spread_node = next(node for node in nodes if node['id'] == spread_node_id)
    
    # Extract the opinion key for the current topic
    opinion_key = f"opinion_{topic-1}"
    
    # Iterate over the links to find connected agents
    for link in links:
        if link['source']['id'] == spread_node_id or link['target']['id'] == spread_node_id:
            # Determine the ID of the connected agent
            connected_agent_id = link['target']['id'] if link['source']['id'] == spread_node_id else link['source']['id']
            
            # Find the connected agent node
            connected_agent = next(node for node in nodes if node['id'] == connected_agent_id)
            
            # Check if the connected node is of type "agent"
            if connected_agent['type'] == 'Agent':
                # Calculate the trust value (assuming it's always 1 for now as per the PDDL)
                trust_value = 1   
            
                # Update the stance of the connected agent based on the effect
                connected_agent[opinion_key] += trust_value * (spread_node[opinion_key] - connected_agent[opinion_key])
    
                
    print(f"Spread Info from agent id {spread_node_id} based on the plan step: {current_plan_step}")
    
    return jsonify(nodes=nodes)

@app.route('/generate_plan', methods=['POST'])
def generate_plan():
    data = request.json
    nodes = data['nodes']
    links = data['links']
    goalNodeData = data['goalNodeData']

    domain_file = "script/domain.pddl"

    # create PDDL file
    create_pddl_file(nodes, links, goalNodeData)
    plan = run_planner(domain_file, "script/test-problem.pddl")

    return jsonify(plan)


@app.route('/get_data', methods=['POST'])
def get_data():
    data = request.get_json()
    num_agents = data.get("numAgents")
    num_source_nodes = data.get("numSourceNodes")
    connection_type = data.get("connectionType")
    num_topics = data.get("numTopics")

    nodes, links = generate_data(num_agents, num_source_nodes, connection_type, num_topics)
    return jsonify({"nodes": nodes, "links": links})

if __name__ == '__main__':
    app.run(debug=True, port=5002)
