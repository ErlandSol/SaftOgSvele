// Get all ladders on the connecting platforms
laddersTop = platformTop.GetLadders();
laddersBottom = platformBottom.GetLadders();

// Delete self from list
ds_list_delete(laddersTop,ds_list_find_index(laddersTop,id));
ds_list_delete(laddersBottom,ds_list_find_index(laddersBottom,id));

// Get the nodes from the ladders
GetNodesFromLadders(laddersTop, nodesTop, platformTop);
GetNodesFromLadders(laddersBottom, nodesBottom, platformBottom);

// Check for nodes at the same location
centreNodeTop = GetCentreNode(nodesTop,nodeTop);
centreNodeBottom = GetCentreNode(nodesBottom,nodeBottom);

// Get the closest node in all directions
closestNodeTopLeft     =  GetClosestNodeLeft(nodesTop,nodeTop);
closestNodeTopRight	   =  GetClosestNodeRight(nodesTop,nodeTop);
closestNodeBottomLeft  =  GetClosestNodeLeft(nodesBottom,nodeBottom);
closestNodeBottomRight =  GetClosestNodeRight(nodesBottom,nodeBottom);


if (centreNodeTop != none) {
	nodeTop.AddEdge(new Edge(0,centreNodeTop));
}

if (centreNodeBottom != none) {
	nodeBottom.AddEdge(new Edge(0,centreNodeBottom));
}


if (closestNodeTopLeft != none) {
	var length = point_distance(nodeTop.x, nodeTop.y, closestNodeTopLeft.x, closestNodeTopLeft.y);
	nodeTop.AddEdge(new Edge(length,closestNodeTopLeft));
}
	
if (closestNodeTopRight != none) {
	var length = point_distance(nodeTop.x, nodeTop.y, closestNodeTopRight.x, closestNodeTopRight.y);
	nodeTop.AddEdge(new Edge(length,closestNodeTopRight));
}
	
if (centreNodeBottom == none) {
	if (closestNodeBottomLeft != none) {
		var length = point_distance(nodeBottom.x, nodeBottom.y, closestNodeBottomLeft.x, closestNodeBottomLeft.y);
		nodeBottom.AddEdge(new Edge(length,closestNodeBottomLeft));
	}

	if (closestNodeBottomRight != none) {
		var length = point_distance(nodeBottom.x, nodeBottom.y, closestNodeBottomRight.x, closestNodeBottomRight.y);
		nodeBottom.AddEdge(new Edge(length,closestNodeBottomRight));
	}
}


canDraw = true;

//  Rules:
//  
//  A node should connect to the closest node on each side, with one exeption:
//  
//  If two nodes are at the same location, or in other words two ladders are on top of each other,
//  the node on the bottom ladder connects to the sides, but the one above does not
//  the same goes for connecting the other way, only the bottom one should be a target
//  the ladder above should ONLY connect downwards
/*

*/
