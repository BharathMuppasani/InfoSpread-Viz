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

const symbolGenerator = d3.symbol();

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
            const nodeData = d3.select(previouslySelectedNode).data()[0];
            if (nodeData.type === 'Source') {
                d3.select(previouslySelectedNode)
                  .attr("d", symbolGenerator.type(d3.symbolTriangle).size(200)());
            } else {
                d3.select(previouslySelectedNode)
                  .attr("d", symbolGenerator.type(d3.symbolCircle).size(100)());
            }
            d3.select(previouslySelectedNode).attr("filter", null); // Remove the glow effect
            previouslySelectedNode = null;
            selectedNode = null;
        }
    }
});


// Get the modal
var modal = document.getElementById("matrixModal");

// Get the button that opens the modal
var btn = document.getElementById("openMatrixModal");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];


let matrixValues = {};

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
    populateMatrix();
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function populateMatrix() {
    const numTopics = parseInt(document.getElementById("numTopics").value);
    const table = document.getElementById("dependencyMatrix");
    table.innerHTML = "";  // Clear the table

    // Create table header for column labels
    let headerRow = table.insertRow();
    headerRow.insertCell().innerHTML = "";  // Empty cell for top-left corner
    for (let i = 1; i <= numTopics; i++) {
        let headerCell = headerRow.insertCell();
        headerCell.innerHTML = "Topic-" + i;
        headerCell.style.fontWeight = "bold";
        headerCell.style.textAlign = "center";
        headerCell.style.fontSize = "12px"; // Reduced font size
        headerCell.style.padding = "4px";   // Reduced padding
    }

    for (let i = 1; i <= numTopics; i++) {
        let row = table.insertRow();

        // Add row labels
        let rowLabel = row.insertCell();
        rowLabel.innerHTML = "Topic-" + i;
        rowLabel.style.fontWeight = "bold";
        rowLabel.style.textAlign = "center";
        rowLabel.style.fontSize = "12px"; // Reduced font size
        rowLabel.style.padding = "4px 10px";   // Reduced padding

        for (let j = 1; j <= numTopics; j++) {
            let cell = row.insertCell();
            let input = document.createElement("input");
            input.type = "number";
            input.step = 0.1;
            input.min = -1;
            input.max = 1;
            input.value = (matrixValues[i] && matrixValues[i][j]) || 0;
            cell.appendChild(input);
        }
    }
}


document.getElementById("submitMatrix").addEventListener("click", function() {
    const table = document.getElementById("dependencyMatrix");
    for (let i = 1; i < table.rows.length; i++) {  // Start from 1 to skip the header row
        const row = table.rows[i];
        if (!matrixValues[i]) {
            matrixValues[i] = {};
        }
        for (let j = 1; j < row.cells.length; j++) {  // Start from 1 to skip the label cell
            const input = row.cells[j].querySelector("input");
            matrixValues[i][j] = parseFloat(input.value);
        }
    }
    modal.style.display = "none";
});


// Define a filter for the glow effect
svg.append("filter")
    .attr("id", "glow")
    .append("feGaussianBlur")
    .attr("stdDeviation", 2.5)
    .attr("result", "coloredBlur");


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

function updateVisualization(numAgents, numSourceNodes) {
    const connectionType = document.getElementById("connectionType").value;
    const numTopics = parseInt(document.getElementById("numTopics").value);
    const selectedTopic = parseInt(document.getElementById("selectedTopic").value);

    const topicSelect = document.getElementById("selectedTopic");

    // Populate the visualization topic selector
    populateVisualizationTopicSelector(numTopics);

    while (topicSelect.firstChild) {
        topicSelect.removeChild(topicSelect.firstChild);  // Clear previous options
    }
    for (let i = 0; i < numTopics; i++) {
        const option = document.createElement("option");
        option.value = i;
        option.text = "Topic-" + (i + 1);
        topicSelect.appendChild(option);
    }

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
            numSourceNodes: numSourceNodes,
            connectionType: connectionType,
            numTopics: numTopics,
            selectedTopic: selectedTopic
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
        // Define a symbol generator

        // Re-draw nodes and attach click and drag events
        let node = svg.append("g")
            .selectAll(".node")
            .data(nodes)
            .enter().append("path")
            .attr("class", "node")
            .attr("d", function(d) {
                // Set initial size based on type
                if (d.type === 'Source') {
                    return symbolGenerator.type(d3.symbolTriangle).size(200)();
                } else {
                    return symbolGenerator.type(d3.symbolCircle).size(100)();
                }
            })
            .attr("fill", function(d) {
                const selectedTopicIndex = document.getElementById("selectedTopic").value;
                const opinionKey = `opinion_${selectedTopicIndex}`;
                return colorScale(d[opinionKey]);
            })
            .attr("stroke-width", 1)  // Initial stroke width for all nodes
            .on('click', function(event, d) {
                event.stopPropagation();
                
                // Reset the size of all nodes to default based on type
                node.attr("d", d => {
                    if (d.type === 'Source') {
                        return symbolGenerator.type(d3.symbolTriangle).size(200)();
                    } else {
                        return symbolGenerator.type(d3.symbolCircle).size(100)();
                    }
                }).attr("filter", null);  // Remove glow effect
            
                // Deselect the previously selected node
                if (previouslySelectedNode) {
                    d3.select(previouslySelectedNode).attr("filter", null); // Remove glow effect from previously selected node
                }
            
                // Highlight the clicked node by increasing its size based on type
                d3.select(this).attr("d", d => {
                    if (d.type === 'Source') {
                        return symbolGenerator.type(d3.symbolTriangle).size(300)();
                    } else {
                        return symbolGenerator.type(d3.symbolCircle).size(200)();
                    }
                }).attr("filter", "url(#glow)");
            
                previouslySelectedNode = this;
                selectedNode = d;
            
                console.log('Node clicked:', d.id);
                updateAgentDetails(d);
            })
            .attr("transform", d => `translate(${d.x}, ${d.y})`)
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
                .attr("transform", d => `translate(${d.x}, ${d.y})`);
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
    document.getElementById("nodeType").textContent = d.type;
    
    const selectedTopicIndex = document.getElementById("visualizationTopicSelector").value;
    const opinionKey = `opinion_${selectedTopicIndex}`;
    const topicLabel = `Topic-${parseInt(selectedTopicIndex) + 1} Opinion`;

    document.getElementById("nodeOpinionLabel").textContent = topicLabel;
    document.getElementById("nodeOpinion").textContent = d[opinionKey].toFixed(2);
    
    document.getElementById("agentDetails").style.display = 'block';
}

// ############################ Code for running simulation ############################

let numberOfIterations = document.getElementById("iterations").value;

document.getElementById("runSimulation").addEventListener("click", function() {
    const modelType = document.getElementById("modelType").value;
 
    let numberOfIterations = parseInt(document.getElementById("iterations").value);
    totalIterations += numberOfIterations;

    const selectedTopic = document.getElementById("selectedTopic").value;

    // Set the visualizationTopicSelector to the selected topic from the simulation dropdown
    document.getElementById("visualizationTopicSelector").value = selectedTopic;

    fetch("http://localhost:5002/update_opinions", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            nodes: nodes,
            links: links,
            modelType: modelType,
            iterations: numberOfIterations,
            selectedTopic: selectedTopic,
            dependencyMatrix: matrixValues
        })
    })
    .then(response => response.json())
    .then(data => {
        // Update the nodes with the received data
        const opinionKey = `opinion_${selectedTopic}`;
        for (let i = 0; i < nodes.length; i++) {
            nodes[i][opinionKey] = data.nodes[i][opinionKey];
        }
    
        // Trigger the D3 visualization to update
        refreshVisualization();
        updateIterationCount(totalIterations);
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
    const selectedTopicIndex = document.getElementById("visualizationTopicSelector").value;
    const opinionKey = `opinion_${selectedTopicIndex}`;

    // Duration for the transition (in milliseconds)
    const transitionDuration = 500;  // example: 1 second
    
    // Select all nodes (both circles and triangles) and smoothly transition their fill based on the selected topic's opinion value
    d3.selectAll(".node")
      .transition()  // Start a transition
      .duration(transitionDuration)  // Define the duration of the transition
      .attr("fill", d => colorScale(d[opinionKey])); 
    
    // If needed, update the links or any other visualization elements as well
    // ...
}

function updateIterationCount(count) {
    document.getElementById("iterationCount").innerText = `Iterations: ${count}`;
}

function populateVisualizationTopicSelector(numTopics) {
    const topicSelector = document.getElementById("visualizationTopicSelector");
    
    // Clear previous options
    while (topicSelector.firstChild) {
        topicSelector.removeChild(topicSelector.firstChild);
    }
    
    for (let i = 0; i < numTopics; i++) {
        const option = document.createElement("option");
        option.value = i;
        option.text = "Topic-" + (i + 1);
        topicSelector.appendChild(option);
    }
}

document.getElementById("visualizationTopicSelector").addEventListener("change", function() {
    refreshVisualization();
    if (selectedNode !== null) {
        updateAgentDetails(selectedNode);
    }
});


document.getElementById("updateButton").addEventListener("click", function() {
    const numAgents = parseInt(document.getElementById("agentInput").value);
    const numSourceNodes = parseInt(document.getElementById("sourceInput").value);

    updateVisualization(numAgents, numSourceNodes);
});

// Initial draw
updateVisualization(nodes.length, 1);