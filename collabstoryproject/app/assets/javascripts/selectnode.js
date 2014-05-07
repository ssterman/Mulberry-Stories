

function setup() {
	// document.addEventListener('mousemove', function(e){ 
 //    	$(document).data("mouse", { x: e.pageX, y: e.pageY });
	// }, false);
}

//reference: http://bl.ocks.org/benzguo/4370043
function d3visdisplay2(json_data) {
	var width = 500;
	var height = 500;

	var color = d3.scale.category20();

	// mouse event vars
	var selected_node = null,
	    selected_link = null,
	    mousedown_link = null,
	    mousedown_node = null,
	    mouseup_node = null;

	// init svg
	var outer = d3.select("#viscontainer")
	  .append("svg:svg")
	    .attr("width", width)
	    .attr("height", height)
	    .attr("pointer-events", "all");
	    

	var vis = outer
	  .append('svg:g')
	    .on("mousemove", mousemove)
	    .on("mousedown", mousedown)
	    .on("mouseup", mouseup);

	vis.append('svg:rect')
	    .attr('width', width)
	    .attr('height', height)
	    .attr('fill', 'white');

	vis.append("svg:defs").append("marker")
	    .attr("id", "arrowhead")
	    .attr("refX", 20) /*must be smarter way to calculate shift*/
	    .attr("refY", 2)
	    .attr("markerWidth", 6)
	    .attr("markerHeight", 4)
	    .attr("orient", "auto")
	    .append("svg:path")
        	.attr("d", "M 0,0 V 4 L6,2 Z"); //this is actual shape for arrowhead

	// init force layout
	var force = d3.layout.force()
	    .size([width, height])
	    .nodes(json_data.nodes)
	    .links(json_data.links)
		.gravity(.05)
        .distance(80)
        .charge(-250)
	    .on("tick", tick);

	// line displayed when dragging new nodes
	var drag_line = vis.append("line")
	    .attr("class", "drag_line")
	    .attr("x1", 0)
	    .attr("y1", 0)
	    .attr("x2", 0)
	    .attr("y2", 0);

	// get layout properties
	var nodes = force.nodes();
	var links = force.links();
	var node = vis.selectAll(".node");
	var link = vis.selectAll(".link");

	redraw();


	function mousedown() {
		if (mousedown_node) {
			var read_area = document.getElementById("read")
				read_area.innerHTML = mousedown_node.text;
		}
	}

	function mousemove() {
	  if (!mousedown_node) return;

	  // update drag line
	  drag_line
	      .attr("x1", mousedown_node.x)
	      .attr("y1", mousedown_node.y)
	      .attr("x2", d3.mouse(this)[0])
	      .attr("y2", d3.mouse(this)[1]);
	}

	function showEditScreen(source, target) {
		target.text = "You just created a node with id " + target.id + ". You may edit the node below and then save it.";
		var read_area = document.getElementById("read")
		read_area.innerHTML = target.text;
		$("#write").show();
		$("#node_source").val(source.id);
	}

	function mouseup() {
	  if (mousedown_node) {
	    // hide drag line
	    drag_line
	      .attr("class", "drag_line_hidden")

	    if (!mouseup_node) {

	    	//show editing screen
	        var id = nodes.length + 1;
	        var source = mousedown_node;

	      // add node
	      var point = d3.mouse(this);
	      var node = {x: point[0], y: point[1], "id": id};
	      var n = nodes.push(node);


	        var target = node;
	      	showEditScreen(source, target);


	      // select new node
	      selected_node = node;
	      selected_link = null;
	      
	      // add link to mousedown node
	      links.push({source: mousedown_node, target: node});
	    }

	    redraw();
	  }
	  // clear mouse event vars
	  resetMouseVars();
	}

	function resetMouseVars() {
	  mousedown_node = null;
	  mouseup_node = null;
	  mousedown_link = null;
	}

	function tick() {
	  link.attr("x1", function(d) { return d.source.x; })
	      .attr("y1", function(d) { return d.source.y; })
	      .attr("x2", function(d) { return d.target.x; })
	      .attr("y2", function(d) { return d.target.y; });

	  node.attr("cx", function(d) { return d.x; })
	      .attr("cy", function(d) { return d.y; });
	}

	// redraw force layout
	function redraw() {

	  link = link.data(links);

	  link.enter().insert("line", ".node")
	      .attr("class", "link")
		  .attr("marker-end", "url(#arrowhead)")
		  // .attr("d", diagonal)
	      .on("mousedown", 
	        function(d) { 
	          mousedown_link = d; 
	          if (mousedown_link == selected_link) selected_link = null;
	          else selected_link = mousedown_link; 
	          selected_node = null; 
	          redraw(); 
	        })

	  link.exit().remove();

	  link
	    .classed("link_selected", function(d) { return d === selected_link; });

	  node = node.data(nodes);

	  node.enter().insert("circle")
	      .attr("class", "node")
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
		  			//this y calc is super hacky and needs to change
		  			var y_height = height*d.truth_height/2 + 50;
		  			console.log(y_height);
		  			d.y = y_height; 
		  			d.px = d.id*20;
		  			d.py = y_height; 
		  			return true;
		  		}
		  	})
	      .on("mousedown", 
	        function(d) { 

	          mousedown_node = d;
	          if (mousedown_node == selected_node) selected_node = null;
	          else selected_node = mousedown_node; 
	          selected_link = null; 

	          // reposition drag line
	          drag_line
	              .attr("class", "link")
	              .attr("x1", mousedown_node.x)
	              .attr("y1", mousedown_node.y)
	              .attr("x2", mousedown_node.x)
	              .attr("y2", mousedown_node.y);

	          redraw(); 
	        })
	      .on("mousedrag",
	        function(d) {
	          // redraw();
	        })
	      .on("mouseup", 
	        function(d) { 
	          if (mousedown_node) {
	            mouseup_node = d; 
	            if (mouseup_node == mousedown_node) { resetMouseVars(); return; }

	            // add link
	            var link = {source: mousedown_node, target: mouseup_node};
	            $("#link_source").val(mousedown_node.id);
	            $("#link_target").val(mouseup_node.id);
	            links.push(link);


	            // select new link
	            selected_link = link;
	            selected_node = null;

	            redraw();
	            $("#new_link_connection").submit();
	          } 
	        })
	    .transition()
	      .duration(750)
	      .ease("elastic")
	      .attr("r", 15);

	  node.exit().transition()
	      .attr("r", 0)
	    .remove();

	  node
	    .classed("node_selected", function(d) { return d === selected_node; });

	  if (d3.event) {
	    // prevent browser's default behavior
	    d3.event.preventDefault();
	  }

	  force.start();

	}

}