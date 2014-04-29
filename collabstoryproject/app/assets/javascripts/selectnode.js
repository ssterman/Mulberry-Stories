

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
	if (e.target == document.getElementById("viscontainer")) {
		console.log("creating new node", e);

		//create new node div and display
		var newnode = document.createElement('div');
		newnode.className = 'node';
		e.target.appendChild(newnode);

		//open the write interface (text input form)
		var write = document.getElementById('write');
		write.style.display = "inline";
		//add entry to database if saved (tie to a form submit)
	}
}