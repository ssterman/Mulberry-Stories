//drag to add reference: http://bl.ocks.org/benzguo/4370043
//arrows reference: http://logogin.blogspot.com/2013/02/d3js-arrowhead-markers.html


var editing = false;
var currNode = null;
var currLink = null;
var opened_node = null;
var selected_ids = null;

//these are global vars for controlling panning
var panX = 0;
var panY = 0;

var mouseX;
var mouseY;

var zoom = false;

//need this to stop weird panning behavior
$("#vis-wrapper").mousedown(function(e) {
	e.preventDefault();
});
$("#vis-wrapper").mouseup(function (e) {zoom = false;});


function init_placeholder() {
	$(".editable_text").addClass('placeholder');
	$('.placeholder').on('input', function(){
	    if ($(this).text().length > 0) {
	        $(this).removeClass('placeholder');
	    } else {
	        $(this).addClass('placeholder');
	    }
	});
}



function display_graph(json_data) {
	$(".editable_text").empty(); // Must empty the text area on load or else it has a 
									// fucking weird phantom value of 4
	var width = 500;
	var height = 500;

	var color = d3.scale.category20();
	console.log(json_data);

	// mouse event vars
	var selected_node = null,
		selected_node_arr = [];
	    selected_link = null,
	    mousedown_link = null,
	    mousedown_node = null,
	    mouseup_node = null;
	    child_nodes = [];

	$("#add_constraint").click(function() {
		if ($(this).hasClass("plus")) {
			$("#submit_text_area2").show();
			$("#submit_text_area2").focus();
			var cur_constraint = selected_node_arr[selected_node_arr.length - 1].constraint_num;
			var intro_text = "<p class='constraint_p1'>Plot twist challenge!</p>" + "<p class='constraint_p2'>" +
				json_data.constraints[cur_constraint].title + ": " + 
				json_data.constraints[cur_constraint].text + "</p>";
			$("#constraint_content").html(intro_text);
			$("#constraint_content").show();
			$(this).removeClass("plus");
			$(this).addClass("minus");
			if ($("#submit_text_area").html().length === 0) {
				$("#submit_text_area").hide();
			}
		} else {
			$("#submit_text_area2").hide();
			$("#constraint_content").hide();
			$("#submit_text_area").show();
			$(this).removeClass("minus");
			$(this).addClass("plus");
		}
	});

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

	//adds the arrows; note that need to change refX to account for size of the circle
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

	var force;
	var drag_line;
	var nodes;
	var links;
	var node;
	var link;

	function initForceLayout(json_data) {
		 force = d3.layout.force()
		    .size([width, height])
		    .nodes(json_data.nodes)
		    .links(json_data.links)
			.gravity(.05)
	        .distance(60)
	        .charge(-380)
		    .on("tick", tick);

		// line displayed when dragging new nodes
		 drag_line = vis.append("line")
		    .attr("class", "drag_line")
		    .attr("stroke-width", 3)
		    .attr("x1", 0)
		    .attr("y1", 0)
		    .attr("x2", 0)
		    .attr("y2", 0);
		drag_line
		      .attr("class", "drag_line_hidden")

		// get layout properties
		 nodes = force.nodes();
		 links = force.links();
		 node = vis.selectAll("g.gnode");
		 link = vis.selectAll(".link");
	}

	initForceLayout(json_data);
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
		$("#publish-bar").hide();
	}

	function mousedown() {
		if (mousedown_node) {
			updateRead();
		}
		else {
			var e = d3.event;
			zoom = true;
			mouseX = e.pageX;
			mouseY = e.pageY;
		}
	}


	function mousemove() {
	//panning behavior on drag
	  if (zoom) {
	  	var e = d3.event;
	  	var oldMX = mouseX;
	  	var oldMY = mouseY;
	  	mouseX = e.pageX;
	  	mouseY = e.pageY;
		panX += mouseX - oldMX;
		panY += mouseY - oldMY;
        vis.attr("transform", "translate(" + panX + "," + panY + ")");
	  }

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
		var new_node = target;
		console.log(new_node);
		init_placeholder();
		editing = true;
		$("#write").show();
		$("#tag-input").val("");
		$("#submit_text_area").empty();
		$("#submit_text_area2").empty();
		$("#publish-bar").show();
		$("#submit_text_area").focus();
		$("#submit_sourceID").val(source.id);
		$("#submit_constraint_num").val(source.constraint_num);
		$("#error_msg").hide();
		$("#tagline").show();
		$("#constraint_content").hide();
		$("#submit_text_area2").hide();
		$("#add_constraint").removeClass("minus");
		$("#add_constraint").addClass("plus");
		save_to_db(new_node);
	}

	function updateConstraintBar(index) {
		$(".constraint").removeClass("constraint-finished");
		$(".constraint").removeClass("constraint-selected");
		$( ".constraint-tabs-list li:eq(" + index + ")" ).addClass("constraint-selected");
		$( ".constraint-selected" ).prevAll().addClass("constraint-finished");

			// setup constraints bar text
		$(".constraint").each(function( i ) {
			//console.log(json_data);
			if (i < index) {
  				$(this).text(json_data.constraints[i].title.toUpperCase());
  			} else {
  				var str = "Event " + (index + 1);
  				$(this).text(str.toUpperCase());
  			}
		});
	}

	//constraints on multiselect paths
	function addToSelectedArr() {
		var switchChild = [];

		//checks for a link between mousedown node and last node in array;
		//if not, then clear array then add MDN
      	var length = selected_node_arr.length;
      	var index;
      	var switchChild = links.filter(function (d) {
      		for (i = 0; i < length; i++) {
      			var parent_id = selected_node_arr[i].id;
      			if (d.target.id == mousedown_node.id && d.source.id == parent_id) {
	      			index = i;
      				return true;
      			}
      		}
      		return false;
      	});
	    //if this is an alternate child on the current branch
	    //replace the current child with the new child
      	if (switchChild.length != 0) {
      		// console.log("this is switching children");
      		removeFromSelectedArr(index + 1);
      		selected_node_arr.push(mousedown_node);

      	//if there's a gap in the tree, delete everything up
      	//to here and start again; may not be optimal behavior
        } else {
        	// console.log("this is resetting the array");
        	selected_node_arr = [];
        	selected_node_arr.push(mousedown_node);
        }
        updateConstraintBar(mousedown_node.constraint_num); // later mousedown_node.constraint
	}

	//removes specified node and all its children
	function removeFromSelectedArr(index) {
		var removeNum = selected_node_arr.length - index;
	    selected_node_arr.splice(index, removeNum);
	    var len = selected_node_arr.length;
	    if (len > 0) {
	    	updateConstraintBar(selected_node_arr[len - 1].constraint_num); // selected_node_arr[len - 1].constraint
	    } else {
	    	updateConstraintBar(0);
	    }
	}

	function save_to_db(target) {
		this.submit_el = document.getElementById("submit_node");

		this.submit_el.onclick = function(event) {
			event.preventDefault();

			selected_ids = selected_node_arr.map(function(el) {
				return el.id;
			});

			var url = "/nodes/save";
			var node_text = $("#submit_text_area").html();
			console.log("NODE TEXT: " + node_text);
			var node_annotation = $("#tag-input").val();
			//console.log("annotation is: " + node_annotation);
			var is_truth = "false";
			target.truth = "false";
			if ($("#add_constraint").hasClass("minus")) {
				node_text += " " + $("#submit_text_area2").html();
				if (node_text.length > 0) {
					is_truth = "true";
					target.truth = "true";

					// constraint_width = target.

				}
				console.log(target);
			}
			if (node_text.length === 0) {
				//$("#tagline").hide();
				$("#error_msg").show();
				//remove_node_reset_writebox();
			} else {
				//console.log(node_text);
				var curStoryId = $("#submit_storyID").val();
				var content = "text=" + node_text;
				content += "&source=" + $("#submit_sourceID").val();
				content += "&storyid=" + $("#submit_storyID").val();
				content += "&userid=" + $("#submit_userID").val();
				content += "&truth=" + is_truth;
				// content += "&constraint_width=" + constraint_width;
				content += "&annotation=" + node_annotation;
				content += "&constraint_num=" + target.constraint_num;

				console.log("Truth is: " + is_truth, "constraint_num is : " + target.constraint_num);

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
					$("#publish-bar").hide();
					console.log("ajax success", node_text);
					selected_node.text = node_formatted;

					opened_node.insert("text")
			      	  .attr("dx", 18)
			      	  .attr("dy", ".9em")
			      	  .text(function(d) { 
			      	  	if (d.text == "") {
			      	  		return "";
			      	  	} else if (node_annotation!= ""){
			      	  		return node_annotation;
			      	  	} else if (d.text.indexOf("<p>") == 0) {
			      	  		// alert("ABBREVIATE!");
			      	  		return d.text.substring(3, 18) + "...";
			      	  	}
			      	  	// alert("RETURN!");
			      		return d.text.substring(0, 15) + "..."; 
			      	  });
					editing = false;
					reset_node_data(curStoryId);
					console.log("selected ids", selected_ids);
				  }
				});
			}
		}
	}

	function reset_selected_node_arr(ids) {
		d3.selectAll(function(d) {
			if (ids.indexOf(d.id) != 0) {
				addToSelectedArr(d);
				return true;
			} else {
				return false;
			}
		});
		console.log(selected_node_arr);
	}

	function reset_node_data(curStoryId) {
		var url = "/stories/getdata/" + curStoryId;
		$.ajax({ url: url,
				  type: 'GET',
				  beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				  success: function(response) {
				  	 console.log('lol success on second request');
				  	 var json = response.substring(response.indexOf("INDEXSTART") + 10, response.indexOf('INDEXEND'));
				  	 console.log(json);
				  	 initForceLayout(JSON.parse(json));

					//black magic. 
					node = vis.selectAll("g.gnode").data(nodes);
					node.remove();
					opened_node = node.enter().append("g").classed("gnode", true);
				  	redraw();
				}
		});
	}

	function remove_node_reset_writebox() {
		nodes.pop();
		links.pop();
		redraw();
		$(".editable_text").empty();
		$("#submit_text_area").empty();
		$("#submit_text_area2").empty();
		$("#tag-input").empty();
		$("#write").hide();
		$("#publish-bar").hide();
		editing = false;
	}

	function drawSelectedNode(node) {
		child_nodes = [];
		links.forEach(function(link) {
			if (link.source == node) {
				child_nodes.push(link.target);
			}
		});
	}

	function mouseup() {
	  zoom = false;
	  console.log('mousing up');
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
	        var node = {x: point[0], y: point[1], "id": id, "text": "", "constraint_num": mousedown_node.constraint_num, "annotation": mousedown_node.annotation};
	        var n = nodes.push(node);

	        var target = node;
	        updateRead();

	        //bug here about making the newly created node
	        //highlighted as well; text shows up, but not orange circle
	        selected_node = node;
	        addToSelectedArr(node);
	      	showEditScreen(source, target);
	      
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
	      // console.log("ticked");
	  /*node.attr("cx", function(d) { return d.x; })
	      .attr("cy", function(d) { return d.y; });*/
	   node.attr("transform", function(d) { 
	   		// console.log("addressed");
    		return 'translate(' + [d.x, d.y] + ')'; 
			});
	}

	// redraw force layout
	function redraw() {
	  //link = link.data(links);
	  link = vis.selectAll(".link").data(links);

	  link.enter().insert("line", "g.gnode")
	      .attr("class", "link")
		  .attr("marker-end", "url(#arrowhead)");

	  link.exit().remove();

	  // link
	  //   .classed("link_selected", function(d) { return d === selected_link; });
	  //node = node.data(nodes);
	  node = vis.selectAll("g.gnode").data(nodes);
	  // node.remove();
	  opened_node = node.enter().append("g").classed("gnode", true);
	  console.log(node, opened_node);

	  //count = 1;
	  //node.enter().append("g").classed("gnode", true).insert("circle")


	  var count = 1;
	  var curConstraintNum = -1;
	  opened_node.insert("circle")
	      .attr("class", "node")
	      .style("fill", function(d) { 
	      		// console.log('fill');
		  		 if (d.truth == true) {
		  			return "rgb(31, 119, 180)";//"#1f77b4";
		  		} else {
		  			return "rgb(174, 199, 232)";
		  		}
		  	})
		  	.attr("fixed", function(d){
		  		if (d.truth == true) {
		  			d.fixed = true;    //this is kinda hacky, but works

		  			if (d.constraint_num == curConstraintNum) {
		  				count +=1;
		  			} else {
		  				count = 1;
		  				curConstraintNum = d.constraint_num
		  			}

		  			d.y = (100 * d.constraint_num);
		  			if (count%2 == 0) {
			  			d.x = width/2 + 25*count;
			  		} else {
			  			d.x = width/2 - 25*count;
			  		}
		  			return true;
		  		}
		  	})
	      .on("mousedown", 
	        function(d) { 
	        	console.log("inner mousedown");
	          mousedown_node = d;
	          //index_node is an indicator of whether or not 
	          //this node is already in the selected_arr or not
	          var index_node = selected_node_arr.indexOf(mousedown_node);
	          if (editing == true) {
	          	remove_node_reset_writebox();
	          }
  	          if (index_node != -1) {
	          	selected_node = null;
	          	removeFromSelectedArr(index_node);

	          }
	          else {
	          	selected_node = mousedown_node;
	          	addToSelectedArr(mousedown_node);
	          	drawSelectedNode(mousedown_node);
	         }

	          // reposition drag line
	          drag_line
	              .attr("class", "link")
	              .attr("x1", mousedown_node.x)
	              .attr("y1", mousedown_node.y)
	              .attr("x2", mousedown_node.x)
	              .attr("y2", mousedown_node.y);
	           drag_line
	      			.attr("class", "drag_line");
	           //console.log("drag line", drag_line);
	           //console.log(mousedown_node.x, mousedown_node.y);

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
	            
	            //this handles links between exisitng nodes
	            $("#link_source").val(mousedown_node.id);
	            $("#link_target").val(mouseup_node.id);
	            links.push(link);
	            //console.log("pushing other link: ", mousedown_node, mouseup_node);

	            redraw();
	            $("#new_link_connection").submit();
	          } 
	        })
	    .transition()
	      .duration(750)
	      .ease("elastic")
	      .attr("r", 15);

	     opened_node.insert("text")
      	  .attr("dx", 18)
      	  .attr("dy", ".9em")
      	  .text(function(d) { 
      	  	if (d.text == "") {
      	  		return "";
      	  	} else if (d.annotation && d.annotation != "") {
      	  		return d.annotation;
      	  	} else if (d.text.indexOf("<p>") == 0) {
      	  		return d.text.substring(3, 18) + "..."; 
      	  	} else {
      			return d.text.substring(0, 15) + "..."; 
      		}
      	  });

	  node.exit().transition()
	      .attr("r", 0)
	    .remove();

	  // console.log("selected node arr at redraw", selected_node_arr);
	  node
	    .classed("node_selected", function(d) { //return d === selected_node; });
	    		// console.log("setting class");
	    		// console.log(selected_node_arr, selected_node_arr.indexOf(d), d);
	    		return (selected_node_arr.indexOf(d) != -1);
	  });
	  node
	    .classed("node_non_selected", function(d) { //return d === selected_node; });
	    		return (selected_node_arr.indexOf(d) == -1 && child_nodes.indexOf(d) < 0);
	  });
	  node
	    .classed("node_child", function(d) { 
	    	if (child_nodes.indexOf(d) >= 0) {
	    		return true;
	    	} else {
	    		return false;
	    	}
	  });

	  //hackety way of maintaining selections
	  if (selected_ids) {
	  	reset_selected_node_arr(selected_ids);
	  	node.classed("node_selected", function(d) {
	  		return selected_ids.indexOf(d.id) != -1

	  	});
	  	selected_ids = null;
	  }

	  if (d3.event) {
	    // prevent browser's default behavior
	    d3.event.preventDefault();
	  }

	  force.start();

	}
	$("#cancel_btn").click(function() {
		if (editing == true){
			remove_node_reset_writebox();
		}
	});

}