/*
if canDraw {
	
	//nodes = graph.GetNodeList();
	
	for (i = 0; i < ds_list_size(nodes); i++) {
		_x = nodes[|i].x;
		_y = nodes[|i].y;
		

		var edges = nodes[|i].GetEdges();
		
		for (e = 0; e < ds_list_size(edges); e++) { 
			var toNode = edges[|e].toNode
			draw_set_color(c_red)
			draw_arrow_width(_x,_y,toNode.x,toNode.y,1,6);
			if (toNode.x == _x) && (toNode.y == _y) {
				draw_circle(_x,_y,3,false);
			}
			draw_set_color(c_white)
			draw_text(_x,_y,nodes[|i].nodeNumber)
		}
	}
	var endNode = graph.GetNode(goal);
	var currentNode = endNode;
	while(currentNode.previousNode != none) {
		
		draw_line_width(currentNode.x,currentNode.y,currentNode.previousNode.x,currentNode.previousNode.y,1);
		
		currentNode = currentNode.previousNode;
	}
	
}
*/











