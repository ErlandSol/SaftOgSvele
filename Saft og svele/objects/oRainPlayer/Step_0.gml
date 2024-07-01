xMoveHold = keyboard_check(ord("D")) - keyboard_check(ord("A"));
xMaxSpeed = (xMaxSpeedStart - (sveleStack.GetSveleCount()/20)) * speedMultiplier;

if (isDown) {
	return;
}
	
	
if (xMoveHold != 0) {
	if (xMoveHold != sign(xSpeed)) && (xSpeed != 0) {	xSpeed = lerp(xSpeed,0,0.4);	}
	xSpeed += xMoveHold * xAcceleration;
	xSpeed = clamp(xSpeed,-xMaxSpeed,xMaxSpeed)
}
else {
	xSpeed = lerp(xSpeed,0,0.4);	
}

if (IsBetween(x+xSpeed+((sprite_width/2-10)*sign(xSpeed)),0,room_width)) x += xSpeed;
else xSpeed = 0;


if (invincible) {
	return;
}
	

//var instance = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top-sveleStack.GetHeight(),oRainItem,false,true);
//if (instance != none) {
//	 if (instance.object_index == Harmful/*#.object_index*/) {	
//		instance_destroy(instance)
//		Hurt();
//		sveleStack.Destroy();	
//	}
//	else if (instance.object_index == oRainBomb/*#.object_index*/) 
//	{ 
//		instance.Explode(); 
//		Hurt();
//		sveleStack.Destroy();	
//	} 
//	else {
//		sveleStack.TryAddToStack(instance,instance.id);
//	}
//}



if (place_meeting(x,y,oDeliveryStation)) {
	if (keyboard_check_pressed(vk_space)) {
		oDeliveryStation.ReplaceStack(sveleStack.MakeCopy());
		sveleStack.Complete();	 
	}
}


if (keyboard_check_pressed(vk_f11)) {
	//window_set_fullscreen(!window_get_fullscreen())
}
