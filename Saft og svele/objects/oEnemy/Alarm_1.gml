/*

alarm[1] = irandom_range(200,600);

xTarget = irandom_range(0,room_width)

if ds_list_size(oGame.platformYPositions) > 0 {
    var randomIndex = irandom_range(0, ds_list_size(oGame.platformYPositions) - 1);
    var randomYPosition = ds_list_find_value(oGame.platformYPositions, randomIndex);
	yTarget = randomYPosition;
} else {
	yTarget = irandom_range(0,room_height)
}

*/







