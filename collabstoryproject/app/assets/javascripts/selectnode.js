
//eventually this should be modified to work with whatever
//visualization we choose; possibly with d3.js
function selectnode(node, output_div, node_text) {

	//reset background color
	var all_nodes = document.getElementsByClassName('node');
	var len = all_nodes.length;
	for (var i = 0; i< len; i++) {
		var curnode = all_nodes.item(i);
		curnode.style.backgroundColor = 'white';
	}

	//set read text
	var outdiv = document.getElementById(output_div);
	outdiv.innerHTML = node_text;

	//set selected color
	node.style.backgroundColor = 'red';
}


function createnode(e) {
// 	if (e.target == document.getElementById("viscontainer")) {
// 		console.log("creating new node", e);

// 		//create new node div and display
// 		var newnode = document.createElement('div');
// 		newnode.className = 'node';
// 		e.target.appendChild(newnode);

// 		//open the write interface (text input form)
// 		var write = document.getElementById('write');
// 		write.style.display = "inline";
// 		//add entry to database if saved (tie to a form submit)
// 	}
}



//this displays the nodes in a force-directed graph using d3
//starter code: http://bl.ocks.org/mbostock/4062045
function d3visdisplay(json_data) {
	// console.log(json_str);

	var graph = json_data;

	var width = 300;
    var height = 300;

	var color = d3.scale.category20();

	var force = d3.layout.force()
	    .charge(-120)
	    .linkDistance(80)
	    .size([width, height]);

	var svg = d3.select("#viscontainer").append("svg")
	    .attr("width", width)
	    .attr("height", height);

	force
	  .nodes(graph.nodes)
	  .links(graph.links)
	  .start();

	var link = svg.selectAll(".link")
	  .data(graph.links)
	.enter().append("line")
	  .attr("class", "link")

	var node = svg.selectAll(".node")
	  .data(graph.nodes)
	.enter().append("circle")
	  .attr("class", "node")
	  .attr("r", 20)
	  .style("fill", function(d) { 
	  	if (d.truth == true) {
	  		return color(1);
	  	} else {
	  		return color(2);
	  	}
	  })
	  .attr("fixed", function(d){
	  	if (d.truth == true) {
	  		d.fixed = true;    //this is kinda hacky, but works
	  		d.x = 100;
	  		d.y = 100;
	  		d.px = 100;
	  		d.py = 100;
	  		return true;
	  	}
	  })
	  .call(force.drag);

	node.append("title")
	  .text(function(d) { return d.id; });

	force.on("tick", function() {
	link.attr("x1", function(d) { return d.source.x; })
	    .attr("y1", function(d) { return d.source.y; })
	    .attr("x2", function(d) { return d.target.x; })
	    .attr("y2", function(d) { return d.target.y; });

	node.attr("cx", function(d) { return d.x; })
	    .attr("cy", function(d) { return d.y; })
	});

}

