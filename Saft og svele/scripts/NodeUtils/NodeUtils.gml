function GetNodesFromLadders(ladderList, nodeList, platform) {
	for (i = 0; i < ds_list_size(ladderList); i++) { // All the ladders on the platform above (GOING UP)
		var ladder = ladderList[|i];
		if (WithinRange(ladder.nodeTop.y,platform.y,5))	 ds_list_add(nodeList,ladder.nodeTop);
		if (WithinRange(ladder.nodeBottom.y,platform.y,5)) ds_list_add(nodeList,ladder.nodeBottom);
	}
}

function GetClosestNodeLeft(nodeList, fromNode) {
	var closestNode = none;
	var shortestDistance = 1000;
	
	for (var i = 0; i < ds_list_size(nodeList); i++)
	{
		var currentNode = nodeList[|i];
	    var currentDistance = abs(currentNode.x - fromNode.x);
	    if (currentDistance < shortestDistance) && (currentNode.x < fromNode.x) {
			shortestDistance = currentDistance;
			closestNode = currentNode;
		}
	}
	return closestNode;
}

function GetClosestNodeRight(nodeList, fromNode) {
	var closestNode = none;
	var shortestDistance = 1000;
	
    for (var i = 0; i < ds_list_size(nodeList); i++)
    {
		var currentNode = nodeList[|i];
        var currentDistance = abs(currentNode.x - fromNode.x);
        if (currentDistance < shortestDistance) && (currentNode.x > fromNode.x) {
			shortestDistance = currentDistance;
			closestNode = currentNode;
		}
    }
	return closestNode;
}
	
function GetCentreNode(nodeList, fromNode) {
	for (var i = 0; i < ds_list_size(nodeList); i++)
    {
		var currentNode = nodeList[|i];
        if (currentNode.x == fromNode.x) && (currentNode.y == fromNode.y)  {
			return currentNode;
		}
    }
	return none;
}