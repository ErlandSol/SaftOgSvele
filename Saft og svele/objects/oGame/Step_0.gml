var numberOfPlates = instance_number(oPlate);
unfinishedPlates = 0;

for (var i = 0; i < numberOfPlates; ++i;)
{
    var plate = instance_find(oPlate,i);
	if (plate.completed != true) unfinishedPlates++;
}


if (unfinishedPlates == 0) && (levelComplete == false) { 
	levelComplete = true;
	oPlayer.state = playerStates.win;
	audio_stop_sound(theme1)
	audio_play_sound(wintheme,0,false); 
	instance_create_layer(0,0,"Div",oOverlayComplete);
	alarm[1] = 250;
}
