falling = false;
fallSpeed = 2;
fallToPosition = 0;
bounced = false;

pushDownValue = 0;
pushDownValueMax = 5;

group = x;


enum states {
	still,
	falling,
	bouncing,
	assembled
}




currentPlatform = -1;




state = states.still;