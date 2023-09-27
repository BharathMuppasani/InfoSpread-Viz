import os


def generate_pddl(nodes, links, goalNodeData):
    # Start with domain and problem declaration
    pddl_str = "(define (problem information-spread-problem)\n"
    pddl_str += "  (:domain information-spread)\n"
    
    # Helper function to get the correct formatted node name
    def get_formatted_node_name(node_id):
        if type(node_id) == dict:
            node_id = node_id['id']
        node_type = [node["type"] for node in nodes if node["id"] == node_id][0]
        if node_type == "Agent":
            return f"agent{node_id}"
        elif node_type == "Source":
            return f"source{node_id}"
        return None

    # Declare objects
    pddl_str += "  (:objects\n"
    flag = True
    for node in nodes:
        if node["type"] == "Agent":
            if flag:
                pddl_str += f"    agent{node['id']} "
                flag = False
            else:
                pddl_str += f"agent{node['id']} "
    pddl_str += " - agent\n"

    flag = True
    for node in nodes:
        if node["type"] == "Source":
            if flag:
                pddl_str += f"    source{node['id']} "
                flag = False
            else:
                pddl_str += f"source{node['id']} "
    pddl_str += " - source\n"

    count_topics = 0
    for node in nodes:
        for key, value in node.items():
            if "opinion" in key:
                count_topics += 1
        break

    flag = True
    for i in range(count_topics):
        if flag:
            pddl_str += f"    topic{i+1} "
            flag = False
        else:
            pddl_str += f"topic{i+1} "
    pddl_str += " - topic\n"
    pddl_str += "  )\n\n"
    
    # Initialize connections and stances
    pddl_str += "  (:init\n\n"
    
    # Declare connections
    for link in links:
        formatted_source = get_formatted_node_name(link['source'])
        formatted_target = get_formatted_node_name(link['target'])
        pddl_str += f"    (connected-agent {formatted_source} {formatted_target})\n"
        pddl_str += f"    (connected-agent {formatted_target} {formatted_source})\n"
        pddl_str += f"    (= (have-trust {formatted_source} {formatted_target}) {int(round(link['weight'],2)*100)})\n"
        pddl_str += f"    (= (have-trust {formatted_target} {formatted_source}) {int(round(link['weight'],2)*100)})\n\n"
    
    pddl_str += "\n"
    
    # Declare stances
    for node in nodes:
        for top in range(count_topics):
            pddl_str += f"    (= (have-stance {get_formatted_node_name(node)} topic{top+1}) {int(round(node[f'opinion_{top}'], 2)*100)})\n"
        pddl_str += "\n"
    
    pddl_str += "\n  )\n\n"
    
    # Declare goal based on goalNodeData
    pddl_str += "  (:goal\n"
    pddl_str += "    (and\n"
    if float(goalNodeData['targetOpinion']) > 0:
        val_10percent = float(goalNodeData['targetOpinion']) * 0.1
        pddl_str += f"      (>= (have-stance {get_formatted_node_name(goalNodeData['nodeId'])} topic{int(goalNodeData['selectedTopic'])+1}) {int((float(goalNodeData['targetOpinion']) - val_10percent)*100)})\n"
        pddl_str += f"      (<= (have-stance {get_formatted_node_name(goalNodeData['nodeId'])} topic{int(goalNodeData['selectedTopic'])+1}) {int((float(goalNodeData['targetOpinion']) + val_10percent)*100)})\n"
    else:
        val_10percent = float(goalNodeData['targetOpinion']) * 0.1
        pddl_str += f"      (>= (have-stance {get_formatted_node_name(goalNodeData['nodeId'])} topic{int(goalNodeData['selectedTopic'])+1}) {int((float(goalNodeData['targetOpinion']) + val_10percent)*100)})\n"
        pddl_str += f"      (<= (have-stance {get_formatted_node_name(goalNodeData['nodeId'])} topic{int(goalNodeData['selectedTopic'])+1}) {int((float(goalNodeData['targetOpinion']) - val_10percent)*100)})\n"
    pddl_str += "    )\n"
    pddl_str += "  )\n"
    pddl_str += ")\n"
    
    return pddl_str

# write to file
def write_pddl(pddl_str):
    with open("script/test-problem.pddl", "w") as f:
        f.write(pddl_str)

def create_pddl_file(nodes, links, goalNodeData):
    pddl_str = generate_pddl(nodes, links, goalNodeData)
    write_pddl(pddl_str)

    print("PDDL file created!")
    
def run_planner(domain_file, problem_file):
    plan = []
    
    # run this command in terminal .\ff-v1.0.exe -o "C:\Users\muppa\Desktop\ICS PDDL model\domain-v2.pddl" -f "C:\Users\muppa\Desktop\ICS PDDL model\problem2.pddl"
    os.system(f".\\script\\metric-ff-crossplatform\\ff-v1.0.exe -o {domain_file} -f {problem_file} > script\\output.txt")
    
    # Read the generated plan.txt file
    with open("script\\output.txt", "r") as file:
        content = file.read()
        
    if "all increasers applied yet goal not fulfilled." in content:
        return ["No plan found"]
        
    if "found legal plan as follows" not in content:
        return 0
    
    # Extract the plan from the file
    plan_content = content.split("found legal plan as follows\n")[-1].split("step")[-1].split("time spent:")[0].split('\n')
    for item in plan_content:
        if item.strip():
            plan.append(item.split(':')[-1].strip())

    print("########### Plan generated! ###########")
    for item in plan:
        print(item)

    return plan
