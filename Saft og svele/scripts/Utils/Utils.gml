#macro SECONDS time_source_units_seconds
#macro MILLISECONDS (time_source_units_seconds / 1000)
#macro FRAMES time_source_units_frames
#macro none noone

#macro RIGHT 1
#macro LEFT -1
#macro UP -1
#macro DOWN 1



function ds_list_find_min(list)
{
    var _min = ds_list_find_value(list, 0); // Get the first value as the initial minimum
    // Loop through the list starting from the second element
    for (var i = 1; i < ds_list_size(list); i++)
    {
        var currentValue = ds_list_find_value(list, i);

        // Update the minimum value if the current value is smaller
        if (currentValue < _min)
        {
            _min = currentValue;
        }
    }
    return _min;
}




function IsBetween(value, minimum, maximum) {
	return minimum <= value && value <= maximum;
}

function WithinRange(a, b, range) {
	return (abs(a-b) <= range)
}




function draw_arrow_width(x1,y1,x2,y2,width,arrowSize) {
	draw_arrow(x1,y1,x2,y2,arrowSize);
	draw_line_width(x1,y1,lerp(x1,x2,0.98),lerp(y1,y2,0.98),width);
}


function collision_line_first(x1,y1,x2,y2,object,prec,notme) {

	var list = ds_list_create();
	var closest = none;
	var num = collision_line_list(x1,y1,x2,y2,object,prec,notme,list,true);
	
	if (num > 0) {
		closest = list[| 0];
	}
	
	ds_list_destroy(list);
	print(string(num))
	return closest;
	
}






function Timer(time, unit) constructor  {
	finished = false;
	t = time;
	TimerFinish = function() {
		finished = true;
	}
	
	timer = time_source_create(time_source_game, time, unit,TimerFinish,[],1);
	
	Start = function() {
		finished = false;
		time_source_reset(timer);
		time_source_start(timer);
	}
	
	Stop = function() {
		finished = false;
		time_source_reset(timer);
	}
	
	GetTimeRemaining = function() {
		return time_source_get_time_remaining(timer);	
	}
		
	GetProgression = function() {
		timeRemaining = GetTimeRemaining();
		print(timeRemaining)
		return timeRemaining / t;
		
	}
	
}

function GetKey(key) {
	return keyboard_check(key);
}
	
function GetKeyPressed(key) {
	return keyboard_check_pressed(key);
}
	
function GetKeyReleased(key) {
	return keyboard_check_released(key);
}

function Vec2(_x = 0,_y = 0) constructor {
	x = _x;
	y = _y;
}

function Line(_x = 0,_y = 0, _xLength, _yLength) constructor {
	x = _x;
	y = _y;
	xLength = _xLength;
	_yLength = _yLength;
}

function CountDown(_defaultValue) constructor {
	defualtValue = _defaultValue;
	currentValue = 0;
	
	Start = function() {
		currentValue = defualtValue;
	}
	
	Stop = function() {
		currentValue = 0;
	}
	
	Count = function() {
		currentValue = max(currentValue-1,0);
	}
	
	Is = function(value) {
		return (currentValue == value);
	}
		
	Run = function(value) {
		if (currentValue == 0) {
			currentValue = defualtValue;
			return true;
		} else {
			currentValue--;
			return false;	
		}
	}
}

function print(text) {
	show_debug_message(text);
}
	

function CollisionLine(_x,_y,xLength,yLength)  {
	return collision_line(_x,_y,_x+xLength,_y+yLength, oCollider, false,true);
}
/*
function CollisionLine(line)  {
	return collision_line(line.x,line.y,line.x+line.xLength,line.y+line.yLength, oCollider, false,true);
}
*/

function DrawLine(_x,_y,xLength,yLength)  {
	draw_line(_x,_y,_x+xLength,_y+yLength);
}



