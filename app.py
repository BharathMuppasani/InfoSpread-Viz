from flask import Flask, request, jsonify
from flask_cors import CORS
import networkx as nx
import random

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
    
    # Assign the 'type' attribute based on num_source_nodes
    for i in range(num_agents):
        nodes[i]['type'] = 'Agent'
    
    for i in range(num_source_nodes):
        temp_idx = random.randint(0, num_agents-1)
        nodes[temp_idx]['type'] = 'Source'
    
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
    dependencyMatrix = data.get("dependencyMatrix")

    print("dependencyMatrix", dependencyMatrix)

    if model_type == "basicOpinion":
        nodes = update_opinions(nodes, links, iterations, selected_topic)
    elif model_type == "voterModel":
        nodes = voter_model_update(nodes, links, iterations, selected_topic)
    elif model_type == "hegselmannKrause":
        nodes = hegselmann_krause_ndlib(nodes, links, iterations, selected_topic)
    # ... handle other models here ...

    return jsonify(nodes=nodes)

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
