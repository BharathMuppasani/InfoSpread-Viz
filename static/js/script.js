// Sample data
let nodes = [
    {id: 0},
    {id: 1},
    {id: 2},
    {id: 3}
];

let links = [
    {source: 0, target: 1},
    {source: 1, target: 2},
    {source: 2, target: 3},
    {source: 3, target: 0}
];

// define constant node color
const nodeColor = "#000000";
var colorScale = d3.scaleLinear()
    .domain([-1,1])
    .range(["red", "blue"]);

let totalIterations = 0;
let previouslySelectedNode = null;
let selectedNode = null;

// Set up SVG canvas dimensions
const width = 800;
const height = 600;

const svg = d3.select("#network")
    .attr("width", width)
    .attr("height", height);
    
    
// Create a simulation for nodes
const simulation = d3.forceSimulation(nodes)
    .force("link", d3.forceLink(links).id(d => d.id))
    .force("charge", d3.forceManyBody())
    .force("center", d3.forceCenter(width / 2, height / 2));

const zoomBehavior = d3.zoom()
    .on("zoom", (event) => {
        const transform = event.transform;
        svg.selectAll('g').attr("transform", transform);
    });

svg.call(zoomBehavior);

// Event listener for SVG background click
d3.select("#network").on("click", function(event, d) {
    if (event.target.tagName === "svg" || event.target.tagName === "SVG") {
        document.getElementById("agentDetails").style.display = 'none'; // Hide the agent details div
        if (previouslySelectedNode) {
            d3.select(previouslySelectedNode).attr("r", 5).attr("filter", null);
            previouslySelectedNode = null;
            selectedNode = null;
        }
    }
});

// Define a filter for the glow effect
svg.append("filter")
    .attr("id", "glow")
    .append("feGaussianBlur")
    .attr("stdDeviation", 2.5)
    .attr("result", "coloredBlur");

// Draw links
let link = svg.append("g")
    .selectAll("line")
    .data(links)
    .enter().append("line")
    .attr("stroke", "#999")
    .attr("stroke-opacity", 0.9);

// Draw nodes, attach click event, and add drag functionality
let node = svg.append("g")
    .selectAll("circle")
    .data(nodes)
    .enter().append("circle")
    .attr("r", 5)
    .attr("fill", d => colorScale(d.opinion))
    .attr("stroke-width", 1)  // Initial stroke width for all nodes
    .on('click', function(event, d) {
        event.stopPropagation();
        // Reset the stroke of all nodes
        node.attr("stroke", null).attr("stroke-width", 1);
        
        // Deselect the previously selected node
        if (previouslySelectedNode) {
            d3.select(previouslySelectedNode).attr("r", 5).attr("filter", null);
        }

        // Highlight the clicked node
        d3.select(this).attr("r", 8).attr("filter", "url(#glow)");  // Increase the size and apply the glow effect
        previouslySelectedNode = this;
        selectedNode = d;

        console.log('Node clicked:', d.id);
        document.getElementById("nodeId").textContent = d.id;
        document.getElementById("nodeOpinion").textContent = d.opinion.toFixed(2);  // Display opinion up to 2 decimal places
        document.getElementById("agentDetails").style.display = 'block'; // Display the agent details div
    })
    .call(d3.drag()
        .on("start", dragstarted)
        .on("drag", dragged)
        .on("end", dragended));


// Update positions based on simulation
simulation.on("tick", () => {
    link
        .attr("x1", d => d.source.x)
        .attr("y1", d => d.source.y)
        .attr("x2", d => d.target.x)
        .attr("y2", d => d.target.y);

    node
        .attr("cx", d => d.x)
        .attr("cy", d => d.y);
});


// Drag functions
function dragstarted(event, d) {
    if (!event.active) simulation.alphaTarget(0.3).restart();
    d.fx = d.x;
    d.fy = d.y;
}

function dragged(event, d) {
    d.fx = event.x;
    d.fy = event.y;
}

function dragended(event, d) {
    if (!event.active) simulation.alphaTarget(0);
    d.fx = null;
    d.fy = null;
}

function updateVisualization(numAgents) {
    const connectionType = document.getElementById("connectionType").value;

    totalIterations = 0;
    updateIterationCount(totalIterations);

    // Make an AJAX request to the Flask backend
    fetch("http://localhost:5002/get_data", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            numAgents: numAgents,
            connectionType: connectionType
        })
    })
    .then(response => response.json())
    .then(data => {
        nodes = data.nodes;
        links = data.links;

        // Clear previous visualization
        svg.selectAll("*").remove();

        // Set nodes and links for the simulation
        simulation.nodes(nodes);
        simulation.force("link").links(links);

        // Re-draw links
        let link = svg.append("g")
            .selectAll("line")
            .data(links)
            .enter().append("line")
            .attr("stroke", "#999")
            .attr("stroke-opacity", 0.9);

        // Re-draw nodes and attach click and drag events
        let node = svg.append("g")
            .selectAll("circle")
            .data(nodes)
            .enter().append("circle")
            .attr("r", 5)
            .attr("fill", d => colorScale(d.opinion))
            .attr("stroke-width", 1)  // Initial stroke width for all nodes
            .on('click', function(event, d) {
                event.stopPropagation();
                // Reset the stroke of all nodes
                node.attr("stroke", null).attr("stroke-width", 1);
                
                // Deselect the previously selected node
                if (previouslySelectedNode) {
                    d3.select(previouslySelectedNode).attr("r", 5).attr("filter", null);
                }

                // Highlight the clicked node
                d3.select(this).attr("r", 8).attr("filter", "url(#glow)");  // Increase the size and apply the glow effect
                previouslySelectedNode = this;
                selectedNode = d;
                
                console.log('Node clicked:', d.id);
                document.getElementById("nodeId").textContent = d.id;
                document.getElementById("nodeOpinion").textContent = d.opinion.toFixed(2);  // Display opinion up to 2 decimal places
                document.getElementById("agentDetails").style.display = 'block'; // Display the agent details div
            })
            .call(d3.drag()
                .on("start", dragstarted)
                .on("drag", dragged)
                .on("end", dragended));

        // Update positions based on simulation
        simulation.on("tick", () => {
            link
                .attr("x1", d => d.source.x)
                .attr("y1", d => d.source.y)
                .attr("x2", d => d.target.x)
                .attr("y2", d => d.target.y);

            node
                .attr("cx", d => d.x)
                .attr("cy", d => d.y);
        });

        // Restart the simulation
        simulation.alpha(1).restart();
        

    })
    .catch(error => {
        console.error("Error fetching data:", error);
    });
}

function updateAgentDetails(d) {
    // Update the agent details div
    document.getElementById("nodeId").textContent = d.id;
    document.getElementById("nodeOpinion").textContent = d.opinion.toFixed(2);
    document.getElementById("agentDetails").style.display = 'block';
}

// ############################ Code for running simulation ############################

let numberOfIterations = document.getElementById("iterations").value;

document.getElementById("runSimulation").addEventListener("click", function() {
    const modelType = document.getElementById("modelType").value;
 
    let numberOfIterations = parseInt(document.getElementById("iterations").value);
    totalIterations += numberOfIterations;

    fetch("http://localhost:5002/update_opinions", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            nodes: nodes,
            links: links,
            modelType: modelType,
            iterations: numberOfIterations
        })
    })
    .then(response => response.json())
    .then(data => {
        // Update the nodes with the received data
        for (let i = 0; i < nodes.length; i++) {
            nodes[i].opinion = data.nodes[i].opinion;
        }
    
        // Trigger the D3 visualization to update
        refreshVisualization();
        updateIterationCount(totalIterations);
        console.log('Selected node:', selectedNode);
        if (selectedNode) {
            let updatedNodeData = selectedNode; // Assumes nodesData is the array with your updated nodes
            if (updatedNodeData) {
                updateAgentDetails(updatedNodeData);
            }
        }
    })
    .catch(error => {
        console.error("Error updating opinions:", error);
    })
});

function refreshVisualization() {
    // Assuming you're using circles to represent nodes and you've bound the nodes array to these circles
    d3.selectAll("circle")
      .attr("fill", d => colorScale(d.opinion)) // Replace colorScale with your logic to color nodes based on opinion
      // ... any other updates based on the opinion value ...

    // If needed, update the links or any other visualization elements as well
}

function updateIterationCount(count) {
    document.getElementById("iterationCount").innerText = `Iterations: ${count}`;
}

document.getElementById("updateButton").addEventListener("click", function() {
    const numAgents = parseInt(document.getElementById("agentInput").value);
    updateVisualization(numAgents);
});

// Initial draw
updateVisualization(nodes.length);