var platformCount = instance_number(oPlatform);

for (var i = 0; i < platformCount; i++) {
    var platform = instance_find(oPlatform, i);
    var posY = platform.y;
    
    // Check if the y position is not already in the array
    if ds_list_find_index(platformYPositions, posY) == -1 {
        ds_list_add(platformYPositions, posY);
    }
}


