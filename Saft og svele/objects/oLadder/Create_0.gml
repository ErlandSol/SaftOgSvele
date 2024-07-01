graph = new Graph();

nodeTop    = graph.AddNode(x,y);
nodeBottom = graph.AddNode(x,y+sprite_height);

nodeTop.AddEdge(new Edge(sprite_height,nodeBottom));
nodeBottom.AddEdge(new Edge(sprite_height,nodeTop));

// Get the platform node is on
platformTop	   = instance_position(x,y,oPlatform);
platformBottom = instance_position(x,y+sprite_height,oPlatform);


print(graph.GetNode(0).GetNodeNumber())

nodesTop    = ds_list_create();
nodesBottom = ds_list_create();

laddersTop    = ds_list_create();
laddersBottom = ds_list_create();


centreNodeTop = none;
centreNodeBottom = none;

closestNodeTopLeft = none;
closestNodeTopRight	= none;
closestNodeBottomLeft = none;
closestNodeBottomRight = none;

colorTop = c_green;
colorBottom = c_red;

canDraw = false;
alarm[0] = 5;

