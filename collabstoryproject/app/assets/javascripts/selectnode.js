
//this displays the nodes in a force-directed graph using d3
//starter code: http://bl.ocks.org/mbostock/4062045
function d3visdisplay(json_data) {

	var graph = json_data;

	//would like to have a dynamic resizing, or at least fit to original
	//window size.  otherwise may want to fix the css to a static size
	var width = 500;//document.getElementById("viscontainer").width;
    var height = 500;//document.getElementById("viscontainer").height;

	var color = d3.scale.category20();

	//sets force characteristics
	var force = d3.layout.force()
	    .charge(-250)			//how far they repel each other
	    .linkDistance(80)
	    .size([width, height]);  //allowable dimensions

	//creats the svg that will hold the visualization
	var svg = d3.select("#viscontainer").append("svg")
	    .attr("width", width)
	    .attr("height", height);

	//initiates force
	force
	  .nodes(graph.nodes)
	  .links(graph.links)
	  .start();

	//creates links from the data
	var link = svg.selectAll(".link")
	  .data(graph.links)
	.enter().append("line")
	  .attr("class", "link")

	//creates nodes from the data
	var node = svg.selectAll(".node")
	  .data(graph.nodes)
	.enter().append("circle")
	  .attr("class", "node")
	  .attr("r", 20)
	  //truth nodes are colored darker than other nodes
	  //may add other color controls in the future
	  .style("fill", function(d) { 
	  	if (d.truth == true) {
	  		return color(1);
	  	} else {
	  		return color(2);
	  	}
	  })
	  //makes truth nodes fixed in the visualization layout
	  .attr("fixed", function(d){
	  	if (d.truth == true) {
	  		d.fixed = true;    //this is kinda hacky, but works
	  		d.x = d.id*20;
	  		//should get a more flexible way of spreading out truth nodes
	  		d.y = d.truth_height*200 + 50;
	  		d.px = d.id*20;
	  		d.py = d.truth_height*200 + 50;
	  		return true;
	  	}
	  })
	  //this controls clicking on a node; displays the text in it
	  .on("click", function(d) {
	  	var rwcontainer = document.getElementById("rwcontainer")
	  	rwcontainer.innerHTML = d.text;
	  })
	  .call(force.drag);

	//title here is the id of the node; 
	//may want to replace with a summary, or first sentence
	node.append("title")
	  .text(function(d) { return d.id; });

// Per-type markers, as they don't inherit styles.
	svg.append("defs").selectAll("marker")
    .data(graph.links)
  .enter().append("marker")
    .attr("id", function(d) { return d; })
    .attr("viewBox", "0 -5 10 10")
    .attr("refX", 15)
    .attr("refY", -1.5)
    .attr("markerWidth", 6)
    .attr("markerHeight", 6)
    .attr("orient", "auto")
  .append("path")
    .attr("d", "M0,-5L10,0L0,5");


	var path = svg.append("g").selectAll("path")
    .data(graph.links)
  	.enter().append("path")
    .attr("class", function(d) { return "node " + d; })
    .attr("marker-end", function(d) { return "url(#" + d.target + ")"; });


	force.on("tick", function() {
	link.attr("x1", function(d) { return d.source.x; })
	    .attr("y1", function(d) { return d.source.y; })
	    .attr("x2", function(d) { return d.target.x; })
	    .attr("y2", function(d) { return d.target.y; });

	node.attr("cx", function(d) { return d.x; })
	    .attr("cy", function(d) { return d.y; })
	});

}

