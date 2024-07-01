currentPlatform = instance_place(x,y,oPlatform);


#region input

pressedUpBuffer   = keyboard_check(ord("W")) ? buttonPressBufferValue : max( 0, pressedUpBuffer - 1);
pressedDownBuffer = keyboard_check(ord("S")) ? buttonPressBufferValue : max( 0, pressedDownBuffer - 1);
xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"));

#endregion 

/*
if (x > room_width) x = 0;
if (x < 0) x = room_width
*/
if (state = playerStates.walking) {
	
	
	
	if xMove != 0 { image_xscale = xMove; sprite_index = spriteMove;} else { image_index = 0; sprite_index = spriteStill;}
	image_speed = xMove;
	xSpeed = xMove * moveSpeed * xSpeedMultiplier;
	
	if (place_meeting(x+xSpeed+(sprite_width/2),y,oPlatform)) {
		x += xSpeed;
	}
	ladderDown = instance_position(x,y+4,oLadder) 
	ladderUp = instance_place(x,y,oLadder) 
	
	if (ladderDown != none) && (pressedDownBuffer != 0) { state = playerStates.climbingDown; audio_stop_sound(soundLadder2); audio_play_sound(soundLadder2,1,true);  }
	if (ladderUp != none)	&& (pressedUpBuffer != 0)	{ state = playerStates.climbingUp;	 audio_stop_sound(soundLadder2);  audio_play_sound(soundLadder2,1,true); }

	if (keyboard_check_pressed(vk_space)) 
	{
		if (canThrowSaft) {
			state = playerStates.throwingSaft;
			sprite_index = spriteThrowSaft;
			canThrowSaft = false;
			image_speed = 1;
		} else {
			audio_play_sound(soundError3,0,false);
		}
	} 
	
	
	
	var svelePart = instance_place(x,y,oSvelePart) 
	if (svelePart != noone) {
		xSpeedMultiplier = 0.85;
		pushDownCounter += abs(xMove*2);
		if (pushDownCounter >= 10) { 
			svelePart.pushDown();	
			pushDownCounter = 0;
		}
	} else {
		pushDownCounter = 0;
		xSpeedMultiplier = 1;
	}
}
			

if (state == playerStates.climbingUp) {
	if (bbox_bottom > ladderUp.bbox_top) y-=1.5 else { state = playerStates.walking; audio_stop_sound(soundLadder2); }
	x = lerp(x,ladderUp.x,0.4);
}
else if (state == playerStates.climbingDown) {
	if (bbox_bottom <= ladderDown.bbox_bottom) y+=1.5 else { state = playerStates.walking; audio_stop_sound(soundLadder2); }
	x = lerp(x,ladderDown.x,0.4);
}



if (state == playerStates.throwingSaft) {
	
	
	if (image_index > image_number-1) {
		state = playerStates.walking;
		alarm[0] = saftReloadTime;	
		sprite_index = spriteMove;
		
		var enemy = collision_line(x,y,x+(image_xscale*50),y,oEnemy,false,true);
		if (enemy != none) enemy.Slip();
		else instance_create_layer(x+(image_xscale*50),y,"Plates",oSaftSpill);	
	}
	


}


alarmValue = alarm_get(0);