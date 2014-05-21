
var editing = false;
var currNode = null;
var currLink = null;

//drag to add reference: http://bl.ocks.org/benzguo/4370043
//arrows reference: http://logogin.blogspot.com/2013/02/d3js-arrowhead-markers.html
function display_graph(json_data) {
	var width = 500;
	var height = 500;

	var color = d3.scale.category20();

	// mouse event vars
	var selected_node = null,
		selected_node_arr = [];
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

	//adds the arrows; not that need to change refX to account for size of the circle
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
        .distance(60)
        .charge(-380)
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

	function updateRead() {
			var read_area = document.getElementById("read");
			var read_text = "";
			for (i = 0; i < selected_node_arr.length; i++) {
				read_text += "<p>" + selected_node_arr[i].text + "</p>";
			}
			//read_area.innerHTML = mousedown_node.text;
			read_area.innerHTML = read_text;
			$("#write").hide();
	}

	function mousedown() {
		if (mousedown_node) {
			updateRead();
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
		//var read_area = document.getElementById("read");
		//read_area.innerHTML = "You just created a node with id " + target.id + ". You may edit the node below and then save it.";
		editing = true;
		$("#write").show();
		$("#submit_text_area").focus();
		$("#submit_sourceID").val(source.id);
		save_to_db();
	}


	//constraints on multiselect paths
	function addToSelectedArr() {
		var directChild = [];
		var switchChild = [];

		//if not a link between mousdown node and last node in array, clear array then add MDN
      	var length = selected_node_arr.length;
      	var index = length - 1;
      	//make sure indices are within bounds
      	if (index > -1) {
	      	var parent = selected_node_arr[index];
	      	var child = mousedown_node;
	      	//using d3 filters to find a link between current node
	      	//and what ought to be its parent; returns an array
	      	var directChild = links.filter(function (d) {
	      		return d.target == child && d.source == parent;
	      	});
	    }
	    index = length - 2;
      	if (index > -1) {
	      	parent = selected_node_arr[index];
	      	var switchChild = links.filter(function (d) {
	      		return d.target == child && d.source == parent;
	      	});
	    }
	    //if this is an alternate child on the current branch
	    //replace the current child with the new child
      	if (switchChild.length != 0) {
      		selected_node_arr[length-1] = mousedown_node;
      	}
      	//if not a switch case, and this isn't a direct child
      	//clear the selection
      	else if (directChild.length == 0) {
        	selected_node_arr = [];
        	selected_node_arr.push(mousedown_node);
        } else {
        	selected_node_arr.push(mousedown_node);
        }
	}

	//removes specified node and all its children
	function removeFromSelectedArr(index) {
		var removeNum = selected_node_arr.length - index;
	    selected_node_arr.splice(index, removeNum);
	}

	function save_to_db(target) {
		this.submit_el = document.getElementById("submit_node");

		this.submit_el.onclick = function(event) {
			event.preventDefault();

			var url = "/nodes/save";
			var node_text = $("#submit_text_area").html();
			$("#submit_text_area").empty();
			var content = "text=" + node_text;
			content += "&source=" + $("#submit_sourceID").val();
			content += "&storyid=" + $("#submit_storyID").val();
			content += "&userid=" + $("#submit_userID").val();

			$.ajax({ url: url,
			  type: 'POST',
			  beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			  data: content,
			  success: function(response) {
			    // $('#someDiv').html(response);
			    var read_area = document.getElementById("read");
			    var node_formatted = node_text.replace(/\n/g, '<br />');
				read_area.innerHTML += "<p>" + node_formatted + "</p>";
				$("#write").hide();
				console.log("ajax success", node_text);
				selected_node.text = node_formatted;
				editing = false;
			  }
			});
		}
	}

	function mouseup() {
	console.log('here');
	  if (mousedown_node) {
	    // hide drag line
	    drag_line
	      .attr("class", "drag_line_hidden")

	    if (!mouseup_node) {
	    	//show editing screen
	        var id = nodes.length + 1;
	        var source = mousedown_node;
	        //this deals with the fact that clicking to drag
	        //to create a new node deselects the parent
	        if (selected_node_arr.indexOf(source) == -1) {
	        	addToSelectedArr(source);
		    }

	        // add node
	        var point = d3.mouse(this);
	        var node = {x: point[0], y: point[1], "id": id};
	        var n = nodes.push(node);

	        var target = node;
	        updateRead();

	        //bug here about making the newly created node
	        //highlighted as well; text shows up, but not orange circle
	        selected_node = node;
	        addToSelectedArr(source);
	      	showEditScreen(source, target);

	      	// add link to mousedown node
	      	links.push({source: mousedown_node, target: node});
	    }
	    console.log('redrawing');
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
	      // .on("mousedown", 
	      //   function(d) { 
	      //     mousedown_link = d; 
	      //     if (mousedown_link == selected_link) selected_link = null;
	      //     else selected_link = mousedown_link; 
	      //     selected_node = null; 
	      //     redraw(); 
	      //   })

	  link.exit().remove();

	  node = node.data(nodes);
	  count = 1;
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
		  			/*d.x = d.id*20;
		  			//this y calc is super hacky and needs to change
		  			var y_height = height*d.truth_height/2 + (50 * count);
		  			count += 1;
		  			//console.log(y_height);
		  			d.y = y_height; 
		  			d.px = d.id*20;
		  			d.py = y_height; */

		  			count += 1;
		  			d.y = (100 * count) - 150;
		  			d.x = 250;
		  			return true;
		  		}
		  	})
	      .on("mousedown", 
	        function(d) { 

	          mousedown_node = d;
	          //index_node is an indicator of whether or not 
	          //this node is already in the selected_arr or not
	          var index_node = selected_node_arr.indexOf(mousedown_node);
  	          if (index_node != -1) {
	          	selected_node = null;
	          	removeFromSelectedArr(index_node);
	          }
	          else {
	          	selected_node = mousedown_node;
	          	addToSelectedArr(mousedown_node);
	          }

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
	            if (mouseup_node == mousedown_node) {
	            	resetMouseVars(); 
	            	return; 
	            }

	            // add link
	            var link = {source: mousedown_node, target: mouseup_node};
	            $("#link_source").val(mousedown_node.id);
	            $("#link_target").val(mouseup_node.id);
	            links.push(link);

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
	    .classed("node_selected", function(d) { //return d === selected_node; });
	    		return (selected_node_arr.indexOf(d) != -1);
	    	});

	  if (d3.event) {
	    // prevent browser's default behavior
	    d3.event.preventDefault();
	  }

	  force.start();

	}

}