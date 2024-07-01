
if (!oRainPlayer.isDown) {
	var xPos = choose(xSpawnStep,xSpawnStep*2,xSpawnStep*3,xSpawnStep*4,xSpawnStep*5,xSpawnStep*6)
	var item = spawnList[irandom(array_length(spawnList)-1)];
	instance_create_layer(xPos,-40,"Food",item);
}
alarm[0] = irandom_range(spawnDelayMin,spawnDelayMax)/oRainPlayer.speedMultiplier;