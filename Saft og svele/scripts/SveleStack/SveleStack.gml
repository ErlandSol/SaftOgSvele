
function SveleStack() constructor {
	
	player = oRainPlayer;
	
	sveler = ds_list_create();
	topping = ds_list_create();
	xOffset = ds_list_create();
	yOffset = ds_list_create();
	xScale = ds_list_create();

	function TryAddToStack(type,ID = none) {
		if (type.object_index == oRainSvele/*#.object_index*/) {
			AddToStack(type);
			player.AddToScore(15, 30);
			if (ID != none) instance_destroy(ID)
		} 
		else if (type.object_index == oRainSviddSvele/*#.object_index*/)  {	
			AddToStack(type);
			player.AddToScore(-15, 30);
			if (ID != none) instance_destroy(ID)
		} 
		else if (!ds_list_empty(sveler) || true) 
		{
			AddToStack(type);
			if (ID != none) instance_destroy(ID)
			player.AddToScore(10, 30);
		}
	}

	function GetSprite(type) {
		var sprite = -1;
		switch (type.object_index) {
		    case oRainSvele/*#.object_index*/: sprite = sSvele; break;			
		    case oRainJam/*#.object_index*/: sprite = sJam; break;				
		    case oRainBlueberries/*#.object_index*/: sprite = sBerries; break;	
			case oRainSourCream/*#.object_index*/: sprite = sSourCream; break;	
			case oRainBrunost/*#.object_index*/: sprite = sBrunost; break;		
			case oRainGulost/*#.object_index*/: sprite = sGulost; break;		
		    default: break;
		}
		return sprite;
	}

	function AddToStack(type) {
		if (type.object_index == oRainSvele/*#.object_index*/) || (type.object_index == oRainSviddSvele/*#.object_index*/) {	
			ds_list_add(sveler,type.sprite_index);
			ds_list_add(xOffset,irandom_range(-2,2));	
			ds_list_add(xScale,type.image_xscale);	
			ds_list_add(yOffset,irandom_range(-2,0));	
		}
		else  {
			ds_list_add(topping,type.sprite_index)
		}
		audio_play_sound(soundHurt1,0,0);
	}

	function Draw(_x,_y,playerSpeed = 0) {
		
		var size = ds_list_size(sveler);
		if (!ds_list_empty(sveler)) {
			for (var i = 0; i < size; i++) { 
				
				var _offset = ((i > 1) ? xOffset[|i] : 0) +  (-playerSpeed/500 * i*i)	
				var rotation = playerSpeed/500 * i*i
				draw_sprite_ext(sveler[|i],0,_x+_offset,_y+yOffset[|i]-48-(4*i),xScale[|i],1,rotation,c_white,1);
			}
		}
		
		var topOffset = 44 + size*4;
		var _offset = (-playerSpeed/1000 * size * size)
		if (ds_list_find_index(topping,sGulost) != -1)		{ draw_sprite(sGulost,0,_x+_offset,_y-topOffset-1)	}
		if (ds_list_find_index(topping,sSourCream) != -1)	{ draw_sprite(sSourCream,0,_x+_offset,_y-topOffset-3) }
		if (ds_list_find_index(topping,sBrunost) != -1)		{ draw_sprite(sBrunost,0,_x+_offset,_y-topOffset-4)	}
		if (ds_list_find_index(topping,sJam) != -1)			{ draw_sprite(sJam,0,_x+_offset,_y-topOffset-4)		}
		if (ds_list_find_index(topping,sBerries) != -1)		{ draw_sprite(sBerries,0,_x+_offset,_y-topOffset-5)	}
	}
		
	function Complete() {
		audio_play_sound(soundComplete,0,0);
		var sveleCount = ds_list_size(sveler); 
		var toppingCount = ds_list_size(topping); 
		var _score = 10*sveleCount + 30*toppingCount;
		player.AddToScore(_score, 30)
		Destroy();
	}
	
	function Destroy() {
		ds_list_clear(sveler);
		ds_list_clear(topping);
		ds_list_clear(xOffset);
		ds_list_clear(yOffset);
		ds_list_clear(xScale);
		audio_play_sound(soundHurt1,0,0);
	}

	function Restart() {
		Destroy();
		AddToStack(oRainSvele);
	}

	function CompleteAndRestart() {
		Complete();
		AddToStack(oRainSvele);
	}
	
	function MakeCopy() {
		var stack = new SveleStack();
		ds_list_copy(stack.sveler,sveler);
		ds_list_copy(stack.topping,topping);
		ds_list_copy(stack.xOffset,xOffset);
		ds_list_copy(stack.yOffset,yOffset);
		ds_list_copy(stack.xScale,xScale);	
		
		return stack;
	}
	
	function Empty() {
		return ds_list_empty(sveler);
	}
	
	
	function GetHeight() {
		return ds_list_size(sveler)*4;
	}
	
	function GetSveleCount() {
		return ds_list_size(sveler);
	}
	
}
/*
function ScoreLookup(type) {
	var _score = 0;
	switch (expression) {
	    case oRainSvele: 20	break;
		
	    default: break;
	}
	
	return _score;
}

scoreLookup = {
	oRainSvele		 : { pickup : 20, loose : 15, deliver : 35 },
	oRainSviddSvele	 : { pickup : -15, loose : 0, deliver : -15},
	oRainGulost		 : { pickup : 10, loose : 3, deliver : 20 },
	oRainSourCream	 : { pickup : 12, loose : 4, deliver : 24 },
	oRainJam		 : { pickup : 15, loose : 5, deliver : 30 },
	oRainBrunost	 : { pickup : 18, loose : 6, deliver : 30 },
	oRainBlueberries : { pickup : 20, loose : 7, deliver : 40 }
}


function Score(_pickup = 10, _loose = 10, _deliver = 10) constructor {
	pickup = _pickup;
	loose = _loose;
	deliver =_deliver;
}
