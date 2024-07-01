currentPlatform = instance_place(x,y,oPlatform);
onPlayerPlatform = (currentPlatform == oPlayer.currentPlatform);

if (moveState == MoveStates.fallen) return;
if (oPlayer.state == playerStates.win) return;
if (oPlayer.state == playerStates.dead) return;

if (moveState == MoveStates.walking) {
	if (onPlayerPlatform) && WithinRange(y,oPlayer.y,2)  { 
		xTarget = oPlayer.x;
		yTarget = oPlayer.y;
		xMove = sign(xTarget-x);
		if place_meeting(x+xMove+(sprite_width/2),y,oPlatform) x += xMove;
	}
	else {
		xTarget = currentNode.x;
		yTarget = currentNode.y;
		if WithinRange(currentNode.x,x,2) && WithinRange(currentNode.y,y,2) {
			NextNode(); 
			if (WithinRange(currentNode.x,x,2)) {
				xTarget = currentNode.x;
				yTarget = currentNode.y;
				climbDirection = (yTarget < y) ? -1 : 1;
				moveState = MoveStates.climbing;
				//return;
			}
		}
		
		xMove = sign(xTarget-x);
		yMove = sign(yTarget-y);
		x += xMove;
		y += yMove;
	}
}


if (moveState == MoveStates.climbing) {
	x = lerp(x,xTarget,0.4);
	if (climbDirection == -1) {
		if (bbox_bottom > yTarget)  y -= 1 else { moveState = MoveStates.walking; NextNode(); audio_stop_sound(soundLadder2);  }
	} else {
		if (bbox_bottom <= yTarget) y += 1 else { moveState = MoveStates.walking; NextNode(); audio_stop_sound(soundLadder2);  }
	}
}




/*
if (pathfindingState = Pathfinding.follow) {
	xTarget = oPlayer.x;
	yTarget = oPlayer.y;
}

if (pathfindingState = Pathfinding.wander) {
	
	if (x == xTarget) x = irandom_range(0,room_width);
	
	
	if (!chosenPoint) { chosenPoint = true; alarm[1] = 2;} 
} else {
	chosenPoint = false;
}
	
if (moveState == MoveStates.walking) {
	if (playerPos == SAME) {
		xMove = sign(xTarget-x);
		chosenLadder = false;
	}
	else {
		if (!chosenLadder) {
			closestLadder = noone;
			closestLadder = (playerPos == ABOVE) ? ChooseLadder(UP) : ChooseLadder(DOWN);
		}

		if (closestLadder != noone) {
			chosenLadder = true;
			xMove = sign(closestLadder.x-x);
			
			if abs(x-closestLadder.x) < 5 {
				climbTarget = closestLadder;

				
				if (playerPos == ABOVE) Climb(UP) else Climb(DOWN)	
			}
		}
	}

	if place_meeting(x+xMove+(sprite_width/2),y,oPlatform) x += xMove;
	else {
		closestLadder = (playerPos == ABOVE) ? ChooseLadder(UP) : ChooseLadder(DOWN);
	}
	
	if xMove != 0 { image_xscale = xMove; sprite_index = sEnemyMove; } else { sprite_index = sEnemy } 

	var saftSpill = instance_place(x,y,oSaftSpill)
	if (saftSpill != none) {
		Slip();
		instance_destroy(saftSpill);
	}
}


if (moveState == MoveStates.climbingUp) {
	chosenLadder = false;
	if (bbox_bottom > climbTarget.bbox_top) y-=1 else { moveState = MoveStates.walking; audio_stop_sound(soundLadder2); }
	x = lerp(x,climbTarget.x,0.4);
}
else if (moveState == MoveStates.climbingDown) {
	chosenLadder = false;
	if (bbox_bottom <= climbTarget.bbox_bottom) y+=1 else { moveState = MoveStates.walking; audio_stop_sound(soundLadder2); }
	x = lerp(x,climbTarget.x,0.4);
}
/*
if (moveState != MoveStates.fallen) && place_meeting(x,y,oPlayer) {
	if (oPlayer.state != playerStates.win) && (oPlayer.state != playerStates.dead) {
		instance_create_layer(0,0,"DIV",oOverlayDeath);
		oPlayer.state = playerStates.dead;
	}
}*/