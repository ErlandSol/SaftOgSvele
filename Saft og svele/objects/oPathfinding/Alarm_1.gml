alarm[1] = 10;

if (canDraw) {
	
	var closestToEnemy  = graph.GetClosestNodeOnPlatform(oEnemy.x,oEnemy.y);
	var closestToPlayer = graph.GetClosestNodeOnPlatform(oPlayer.x,oPlayer.y);

	if (closestToPlayer != none) start = closestToPlayer.nodeNumber; 
	if (closestToEnemy != none) goal = closestToEnemy.nodeNumber;
	
	dijkstra.ShortestPath(start,goal);
}












