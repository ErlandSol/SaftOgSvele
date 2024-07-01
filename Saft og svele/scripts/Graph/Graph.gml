function Graph() constructor 
{
	static nodes = ds_list_create();

	static AddNode = function(_x,_y,_ladder = none) {
		var nodeNumber = ds_list_size(nodes);
		var node = new Node(_x,_y,nodeNumber,_ladder);
		ds_list_add(nodes,node);
		return node;
	}
	
	static GetNode = function(nodeNumber) 
	{
		//ds_list_find_value(nodes, nodeNumber);
		for (i = 0; i < ds_list_size(nodes); i++) {
			if (nodes[|i].nodeNumber == nodeNumber) {
				return nodes[|i]	
			}
		}
		return none
	}
	
	
	static GetClosestNodeOnPlatform = function(_x,_y) 
	{
		var closestNode = none;
		var closestNodeDistance = infinity;

		for (var i = 0; i < ds_list_size(nodes); ++i) {
			var node = nodes[|i];
			var currentDistance = point_distance(node.x,node.y,_x,_y);

			if (currentDistance < closestNodeDistance) && (WithinRange(node.y,_y,5)) {
				closestNodeDistance = currentDistance;
				closestNode = node;
			}
		}
		return closestNode
	}
	
	
	static GetNodeList = function() {
		return nodes;
	}
	
	static Reset = function() {
		ds_list_clear(nodes);	
	}
}
