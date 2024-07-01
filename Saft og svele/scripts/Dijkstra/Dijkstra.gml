function Dijkstra() constructor {
	graph = new Graph();
	nodes = graph.GetNodeList();
	
	function Reset() {
		for (var i = 0; i < ds_list_size(nodes); i++) {
			var node = nodes[|i];
			node.distanceToStart = infinity;
			node.previousNode = none;
			node.inQueue = false;
			node.neighbor = none;
		}
	}
	
	
	
	function ShortestPath(startNode, endNode) {
		Reset();
		var queue = ds_priority_create();
		var start = graph.GetNode(startNode)
		start.distanceToStart = 0;
		ds_priority_add(queue,start,start.distanceToStart)
		var currentNode = ds_priority_delete_min(queue);

		while (currentNode.nodeNumber != endNode) {
			var edges = currentNode.GetEdges();	
			
			for (var i = 0; i < ds_list_size(edges); ++i) {
				var currentEdge = edges[|i];
				var neighbor = currentEdge.toNode;
				var newDistance = currentNode.distanceToStart + currentEdge.length;
				
				if (newDistance < neighbor.distanceToStart) {
					neighbor.distanceToStart = newDistance;
					neighbor.previousNode = currentNode;
					if (!neighbor.inQueue) {
						ds_priority_add(queue,neighbor,neighbor.distanceToStart);
						neighbor.inQueue = true;
					} else {
						ds_priority_change_priority(queue, neighbor, neighbor.distanceToStart);
					}
				}	
			}	
			currentNode.visited = true;
			currentNode.inQueue = false;
			currentNode = ds_priority_delete_min(queue);
			
			if (currentNode = 0) {
				return false;	
			}
			
			if (currentNode.nodeNumber == endNode) {
				return true; 	
			}
		}
		ds_priority_destroy(queue)
		return false;
	}
}