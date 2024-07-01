alarm[0] = 1; // To run code 1 frame after all objects has been initialized
volume = 0;

var num = audio_get_listener_count();
for( var i = 0; i < num; i++;)
{
    var info = audio_get_listener_info(i);
    audio_set_master_gain(info[? "index"], volume);
    ds_map_destroy(info);
}


levelComplete = false;
unfinishedPlates = 0;
audio_play_sound(theme1,0,false); 

platformYPositions = ds_list_create();

