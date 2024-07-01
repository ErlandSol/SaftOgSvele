if state == states.still {

	currentPlatform = instance_place(x,y,oPlatform);
	
	if (currentPlatform == noone) {
		state = states.falling;
		
	}
	
}


if (state == states.falling) { 
	
	if (!place_meeting(x,y+fallSpeed,oAssemblyArea)) {
		
		with instance_place(x,y+fallSpeed,oSvelePart) {
			other.state = states.bouncing;
			other.fallToPosition = y;
			if (state != states.assembled) state = states.falling;
		}
	}
	
	
	var platform = instance_place(x,y+fallSpeed,oPlatform)
	if (platform != noone && platform != currentPlatform) {
		if (y >= platform.y-8) {
			y = platform.y-8;
			state = states.still;
		}
	}
	
	
	if place_meeting(x,y+fallSpeed,oPlate) {
		state = states.assembled;
	}
	
	y += fallSpeed;
} 


if (state == states.bouncing) {
	
	if (bounced == false) {
		bounced = true;
		ySpeed = -1;
	}
	
	ySpeed = min(fallSpeed,ySpeed+0.2);
	y += ySpeed;
	if (y >= fallToPosition) {
		y = fallToPosition;
		state = states.still;
		bounced = false;
		pushDownValue = 0;
		
	}
}

function pushDown() {
	if state == states.still {
		pushDownValue = min(pushDownValueMax,pushDownValue+1);
		y += 1;
		
		if (pushDownValue >= pushDownValueMax) {
			state = states.falling;
			audio_play_sound(soundHurt1,1,false);
			pushDownValue = 0;
		}
		else {
			audio_play_sound(soundThing1,1,false);	
		}
	}
}


