if (!completed) {
	var list = ds_list_create();
	if (collision_line_list(x,y-40,x,y-room_height,ST_oFood,false,true,list,false) == 0) {
		completed = true;
		
		switch (oGame.unfinishedPlates) {
			case 5: audio_play_sound(note0,4,false); break;
			case 4: audio_play_sound(note1,4,false); break;
			case 3: audio_play_sound(note2,4,false); break;
			case 2: audio_play_sound(note3,4,false); break;
			case 1: audio_play_sound(note4,4,false); break;
			case 0: audio_play_sound(note4,4,false); break;
			default: break;
		}
		
		
		
	}
	ds_list_destroy(list);
}



