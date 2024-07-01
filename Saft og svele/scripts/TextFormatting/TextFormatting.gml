function TextFormatting(_color = c_white, _outline = false, _shadow = false, _font = fontConnectQuest2, _scale = 1, o_utlineColor = c_black,_shadowColor = c_black, _outlineOpacity = 1, _shadowOpacity = 1) constructor {

	font = _font;
	scale = _scale;
	color = _color;
	opacity = 1;
	
	shadow = _shadow;
	shadowOpacity = 1;
	shadowColor = c_black;
	shadowOffset = new Vec2(2,2);
	
	outline = _outline;
	outlineOpacity = 1;
	outlineColor = c_black;
	

	function SetFormatting(_hAlignment = fa_left, _vAlignment = fa_top, _seperation = 3, _width = 300) {
		hAlignment = _hAlignment;
		vAlignment = _vAlignment;
		seperation = _seperation;
		width = _width;
	}
	
	function SetColor(_color = c_white, _opacity = 1) {
		color = _color;
		opacity = _opacity;
	}
	
	
	function SetShadow(_active = true, _opacity = 1, _color = c_black, _offset = new Vec2(2,2)) {
		shadow = _active;
		shadowOpacity = _opacity;
		shadowColor = _color;
		
	}
	
	function SetOutline(_active = true, _opacity = 1, _color = c_black) {
		outline = _active;
		outlineOpacity = _opacity;
		outlineColor = _color;
	}	
}