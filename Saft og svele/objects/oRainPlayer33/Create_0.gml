
testText = new Text("test");

scoreText = new Text("test");
//
//

xSpeed = 0;
xMove = 0;
xAcceleration = 0.5;
colliding = none;
sveleContents = ds_list_create();
sveleContentsSprite = ds_list_create();
timeoutMax = 200;
timeout = timeoutMax;
completed = false;


scoreTextOffset = 0;
scoreTimer = 0;
drawOffsets = ds_list_create();

xMoveHold = 0;
xMoveStep = 64;
xPos = xMoveStep;
moved = false;

previousxMove = 0;
repeat(100) {
	ds_list_add(drawOffsets,new Vec2(irandom_range(-3,3),irandom_range(-2,0)))
}

sveleList = ds_list_create();
score = 0;


function TryAdd(type,ID = none,_x = 50, _y = 100) {

	if (type.object_index == oRainSvele) {
		AddLayer(oRainSvele);
		AddToScore(15, 30, _x, _y);
		if (ID != none) instance_destroy(ID)
	} 
	else if (sveleContents[|0] == oRainSvele) 
	{
		if (ds_list_find_index(sveleContents,type.object_index) == -1) {
			AddLayer(type);
		}
		AddToScore(10, 30, _x, _y);
		if (ID != none) instance_destroy(ID)
		
	}
}

function AddLayer(type) {
	var sprite = -1;
	switch (type.object_index) {
	    case oRainSvele: sprite = sSvele; break;
	    case oRainJam: sprite = sJam; break;
	    case oRainBlueberries: sprite = sBerries; break;
		case oRainSourCream: sprite = sSourCream; break;
		case oRainBrunost: sprite = sBrunost; break;
		case oRainGulost: sprite = sGulost; break;
	    default: break;
	}
	
	ds_list_add(sveleContents,type.object_index);
	if (type.object_index == oRainSvele) ds_list_add(sveleList,sSvele);
	else ds_list_add(sveleContentsSprite,sprite)
	audio_play_sound(soundHurt1,0,0);
	timeout += 80;
	
}

function Complete() {
	audio_play_sound(soundComplete,0,0);
	var count = ds_list_size(sveleContents) 
	var _score = 10*count;// + (count >= 6) ?  50 : 0;
	AddToScore(_score, 30)
	Destroy();
	completed = false;
}


function AddToScore(amount, textDuration, _x = x, _y = y) {
	print("SCORE: " + string(score) + " + " + string(amount) + " = " + string(score + amount))
	score += amount;
	scoreText.SetText(string(amount));
	scoreText.SetOutline(true);
	scoreText.SetShadow(true);
	scoreText.SetOffset(choose(-30,-15,15,30));
	scoreTimer = textDuration;
	execute every 10 frames
		scoreTimer--;
		if (scoreTimer <= 0) disable;
	done
}



function Destroy() {
	ds_list_clear(sveleContents);
	ds_list_clear(sveleList);
	ds_list_clear(sveleContentsSprite);
}



function Restart() {
	Destroy();
	timeout = timeoutMax;
	TryAdd(oRainSvele);
	audio_play_sound(soundHurt1,0,0);
}

function CompleteAndRestart() {
	Complete();
	timeout = timeoutMax;
	TryAdd(oRainSvele);
}
