
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

function setup() {
	document.addEventListener('mousemove', function(e){ 
    	$(document).data("mouse", { x: e.pageX, y: e.pageY });
	}, false);
}


function d3visdisplay2(json_data) {

    // set up the D3 visualisation in the specified element
    var w = 500,
        h = 500;

    var vis = this.vis = d3.select("#viscontainer").append("svg:svg")
        .attr("width", w)
        .attr("height", h);

    var force = d3.layout.force()
        .gravity(.05)
        .distance(80)
        .charge(-250)
        .size([w, h]);

    force.nodes(json_data.nodes);
    force.links(json_data.links);
    var nodes = force.nodes();
    var links = force.links();


    var color = d3.scale.category20();

    // Add and remove elements on the graph object
    this.addNode = function (source) {
    	var id = nodes.length + 1;
        nodes.push({"id":id});
        var target = findNode(id);
        console.log("one node added with id: " + id);
        addLink(source, target);
        update();
        showEditScreen(source, target);
    }

    this.removeNode = function (id) {
        var i = 0;
        var n = findNode(id);
        while (i < links.length) {
            if ((links[i]['source'] == n)||(links[i]['target'] == n)) links.splice(i,1);
            else i++;
        }
        nodes.splice(findNodeIndex(id),1);
        update();
    }

    this.addLink = function (source, target) {
    	console.log("one link added between: " + source.id + " -> " + target.id);
        links.push({"source": source,"target":target});
    }

    var findNode = function(id) {
        for (var i in nodes) {if (nodes[i]["id"] === id) return nodes[i]};
    }

    var findNodeIndex = function(id) {
        for (var i in nodes) {if (nodes[i]["id"] === id) return i};
    }

    var update = function () {
		var link = vis.selectAll(".link")
	  		.data(links)
			.enter().append("line")
	  		.attr("class", "link")

		var node = vis.selectAll(".node")
	  		.data(nodes)
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
	  			d.x = d.id*20;
	  			d.y = d.truth_height*200 + 50; //trying to spread out the truth nodes
	  			d.px = d.id*20;
	  			d.py = d.truth_height*200 + 50;
	  			return true;
	  		}
	  	})
	  	//this controls clicking on a node; displays the text in it
	  	// or dragging to create a new node
	  	.on("mousedown", function(d) {
	  		console.log("mousedown");
	  		$(d).data("p0", { x: $(document).data("mouse").x, y: $(document).data("mouse").y });
	  	}).on("mouseup", function(d) {
	  		console.log("mouseup");
	  		var p0 = $(d).data("p0");
	  		console.log(p0);
	  		p1 = { x: $(document).data("mouse").x, y: $(document).data("mouse").y };
	  		dist = Math.sqrt(Math.pow(p1.x - p0.x, 2) + Math.pow(p1.y - p0.y, 2));

	  		if (dist < 10) { // counts as a click
	  			var read_area = document.getElementById("read")
	  			read_area.innerHTML = d.text;
	  		} else {
	  			//addNode(d);
	  		}	  	
	  	}).on("dblclick", function(d) {
	  		console.log("dbl");
	  		addNode(d);
	  	}).call(force.drag);

	  	force.start();

		node.append("title")
	  		.text(function(d) { return d.id; });


    //node.exit().remove();

        force.on("tick", function() {
          	link.attr("x1", function(d) { return d.source.x; })
              	.attr("y1", function(d) { return d.source.y; })
              	.attr("x2", function(d) { return d.target.x; })
              	.attr("y2", function(d) { return d.target.y; });

          	node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
        	});

        // Restart the force layout.
        force.start();
    }
    update();
}

function showEditScreen(source, target) {
	target.text = "You just created a node with id " + target.id + ". You may edit the node below and then save it.";
	var read_area = document.getElementById("read")
	read_area.innerHTML = target.text;
	$("#write").show();
	$("#node_source").val(source.id);
	$("#target_source").val(target.id);
}

function saveNewNode() {
	console.log("hello");
	$.post('superman', { id: "hello", id2 : "hello2"}, 
    function(returnedData){
         console.log("it worked!");
	});
}



