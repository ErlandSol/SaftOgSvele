function Node(_x, _y, _nodeNumber, _ladder = none) constructor
{
	distanceToStart = infinity;
	visited = false;
	inQueue = false;
	previousNode = none;
	
	nodeNumber = _nodeNumber;
	edges = ds_list_create();
	ladder = _ladder;
	
    x = _x;
    y = _y;
	
    GetPos = function()
    {
		return x;
    }
	
	GetNodeNumber = function() {
		return nodeNumber;	
	}
	
	AddEdge = function(_edge) {
		ds_list_add(edges,_edge);
	}
	
	GetEdges = function() {
		return edges;
	}
	
	GetLadder = function() {
		return ladder;	
	}
}

