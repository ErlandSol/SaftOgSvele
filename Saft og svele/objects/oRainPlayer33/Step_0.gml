xMove = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
xMoveHold = keyboard_check(ord("D")) - keyboard_check(ord("A"));

/*
if (xMoveHold != 0) {
	
	if (xMoveHold != sign(xSpeed)) && (xSpeed != 0) {
		xSpeed = lerp(xSpeed,0,0.2);	
	}
	xSpeed += xMoveHold * xAcceleration;
	xSpeed = clamp(xSpeed,-5,5)

	image_xscale = xMoveHold;
}
else {
	xSpeed = lerp(xSpeed,0,0.2);	
}

x += xSpeed;*/

if (xMove != 0) {
	audio_play_sound(choose(soundDash1,soundDash2),0,0);
	xPos += xMove*xMoveStep;	
}

x = lerp(x,xPos,0.3);


var instance = instance_place(x,y,oRainItem)
if (instance != none) {
	 if (instance.object_index == Harmful) {
		instance_destroy(instance)
		audio_play_sound(soundHurt4,0,0);
		Destroy();	
	}
	else {
		TryAdd(instance,instance.id,instance.x,instance.y);
		
	}
}


if (ds_list_size(sveleContents) > 0) {
	timeout = max(timeout-1,0); 
	if (timeout <= 0) {	
		Complete();
		timeout = timeoutMax;
	}
}





if (place_meeting(x,y,oDeliveryStation)) {
	if (keyboard_check_pressed(vk_space)) {
		Complete();	 
	}
}

