/*#.object_index*/      // USE FIND AND REPLACE WITH THIS TO FIX FOR WEB BUILD
scoreTextList = ds_list_create();

textStyle = new TextStyle(c_white,true,true,fontConnectQuest2,1,c_black,c_black,1,1);
testText = new Text("",textStyle);
scoreText = new Text("",textStyle);
healthText = new Text("",textStyle);
health = 3;

isDown = false;
invincible = false;

xMaxSpeedStart = 6;
xMaxSpeed = xMaxSpeedStart;
speedMultiplier = 1;
xSpeed = 0;
xAcceleration = 1;

scoreTimer = 0;

xMoveHold = 0;
xMoveStep = 64;
xPos = xMoveStep;
moved = false;
flash = false;
score = 0;

sveleStack = new SveleStack();

scoreTextOpacity = 1;

downTime = 1;
invincibiltyTime = 1.5;

function AddToScore(amount, textDuration, _x = x, _y = y) {
	print("SCORE: " + string(score) + " + " + string(amount) + " = " + string(score + amount))
	score += amount;
	
	scoreText.SetText(string(amount));
	scoreText.SetOffset(irandom_range(-30,30),irandom_range(-8,8));
	scoreTimer = textDuration;
	scoreTextOpacity = 1;
	execute every 10 frames
		scoreTimer--;
		if (scoreTimer <= 0) disable;
	done
}

function Hurt() {
	health--;
	isDown = true;
	invincible = true;
	x = room_width/2
	
	execute after downTime seconds
		isDown = false;
	done
	
	execute after (downTime + invincibiltyTime) seconds
		invincible = false;
	done
	
	execute every 6 frames 
		flash = !flash;
		if (!invincible) disable;
	done
}


execute every 10 seconds
	speedMultiplier += 0.05;
	if (speedMultiplier >= 3) disable;
done

execute after 3 frames
for (var i = 0; i < 40; ++i) {
	var b = instance_create_layer(x,y,"Food",oRainSvele)
    sveleStack.TryAddToStack(b,b.id);
}
done



