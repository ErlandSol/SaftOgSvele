#macro SVENZ false
#macro BJORN true
alarmValue = 0;
saftReloadTime = 150;


xSpeed = 0;
randomise();
playerType = choose(BJORN,SVENZ);

spriteStill		= playerType ? sBjornStill 	   : sSvenzStill
spriteMove		= playerType ? sBjornMove	   : sSvenzMove
spriteThrowSaft = playerType ? sBjornThrowSaft : sSvenzThrowSaft


canThrowSaft = true;

moveSpeed = 2.2;
pressedUpBuffer = 0;
pressedDownBuffer = 0;
buttonPressBufferValue = 10; // Amount of frames after a button press the action should happen

levelWrapAround = false;
ladderDown = none;
ladderUp = none;

xMove = 0;

pushDownCounter = 0;
climbTarget = 0;


xSpeedMultiplier = 1;

enum playerStates {
	walking,
	climbingUp,
	climbingDown,
	throwingSaft,
	dead,
	win
}

state = playerStates.walking;

function RaycastFirstObject(yOffset,yDistance) {
	var list = ds_list_create();
	var closest = noone;
	var num = collision_line_list(x,y+yOffset,x,y+yDistance,oLadderStop,false,true,list,false);
	if (num > 0) {
		closest = list[| 0];
	}
	ds_list_destroy(list);
	return closest;
}



currentPlatform = none;