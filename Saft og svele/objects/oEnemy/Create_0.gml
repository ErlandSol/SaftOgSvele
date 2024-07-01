graph = new Graph();
dijkstra = new Dijkstra();
nodes = graph.GetNodeList();
startNodeNumber = 0; 
goalNodeNumber = 0;


enum MoveStates {
	walking,
	climbing,
	climbingUp,
	climbingDown,
	fallen,
}

endNode = none;
currentNode = none;

function UpdatePath(closeToNode) {
	var closestToEnemy  = graph.GetClosestNodeOnPlatform(x,y);
	var closestToPlayer = graph.GetClosestNodeOnPlatform(oPlayer.x,oPlayer.y);

	if (closestToPlayer != none) startNodeNumber = closestToPlayer.nodeNumber; 
	if (closestToEnemy != none) goalNodeNumber = closestToEnemy.nodeNumber;
	
	dijkstra.ShortestPath(startNodeNumber,goalNodeNumber);
	
	if (closeToNode) {
		endNode = graph.GetNode(goalNodeNumber);
		currentNode = endNode;
	}
}
UpdatePath(true);
kickstart = true;
function NextNode() {
	if (currentNode.previousNode != none) {
		currentNode = currentNode.previousNode;
	}
}




alarm[0] = 5;


currentPlatform = none;
onPlayerPlatform = false;

//pathfindingState = wander ? Pathfinding.wander : Pathfinding.follow;
moveState = MoveStates.walking

xTarget = 0;
yTarget = 0;

xMove = 0;
yMove = 0;

climbTargetX = 0;
climbTargetY = 0;

climbDirection = 0;

/*


fallenTime = 130;

playerPos = SAME;


chosenPoint = false;

chosenLadder = false;


closestLadder = noone;

canMoveDown = true;
canMoveUp = true;



stuckTimer = 0;
stuckTimerMax = 100;




#endregion

#region Ladders
function FindLadder(xDir,yDir) {
	return collision_line_first(x,y+4*yDir,x+room_width*xDir,y+4*yDir,oLadder,false,true);
}

function ChooseLadder(yDir) {
	
	var left = none
	var right = none
	
	left = FindLadder(LEFT,yDir)
	right = FindLadder(RIGHT,yDir)
	
	var ladder = none;
	
	if (left != none && right != none) {
		var chooseRandom = choose(true,false,false);
		var closestToPlayer = choose(true,false);

		if (chooseRandom) ladder = choose(left, right)
		else if (closestToPlayer) ladder = (abs(oPlayer.x-left.x) < abs(oPlayer.x-right.x)) ? left : right;
		else ladder = (abs(x-left.x) < abs(x-right.x)) ? left : right;
	}
	else if (left != none) ladder = left;
	else if (right != none) ladder = right;
	
	return ladder;
}

function ChooseClosestLadder(left,right) {
	var ladder = none;
	if (left != none && right != none) ladder = (abs(x-left.x) < abs(x-right.x)) ? left : right;
	else if (left != none) ladder = left;
	else if (right != none) ladder = right;
	
	return ladder;
}


function Climb(dir) {
	audio_stop_sound(soundLadder2);
	audio_play_sound(soundLadder2,0,true,0.5);
	moveState = (dir == UP) ? MoveStates.climbingUp : MoveStates.climbingDown;	
}
#endregion

function Slip() {
	alarm[0] = fallenTime;
	moveState = MoveStates.fallen;
	sprite_index = sEnemyFallen;
	audio_play_sound(soundSlipAndFall,0,false);
}


*/