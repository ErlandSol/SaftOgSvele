function Text(_text = "sample text", _textStyle = new TextStyle()) constructor {

	textStyle = _textStyle;
	opacityOverride = 1;
	x = 0;
	y = 0;
	
	xOffset = 0;
	yOffset = 0;
	
	text = _text;
	
	angle = 0;
	
	function SetOpacityOverride(opacity) {
		opacityOverride = opacity;
	}
	
	function SetOffset(_x = 0,_y = 0) {
		xOffset = _x;
		yOffset = _y;
	}
	
	function SetPosition(_x = 0,_y = 0) {
		x = _x;
		y = _y;
	}
	
	function SetText(_text) {
		text = _text;
	}

	function Draw(_x = x, _y = y, _text = text) {
		x = _x;
		y = _y;
		SetText(_text)
		draw_set_halign(textStyle.hAlignment);
		draw_set_valign(textStyle.vAlignment);
		draw_set_alpha(min(textStyle.opacity,opacityOverride));
		
		draw_set_font(textStyle.font);
		
		if (textStyle.shadow) DrawShadow();	
		if (textStyle.outline) DrawOutline();
		
		draw_set_color(textStyle.color);
		DrawText(x,y);
		draw_set_color(c_white);
	}
	
	function DrawText(_x,_y) {
		draw_text_ext_transformed(_x+xOffset,_y+yOffset,text,textStyle.seperation,textStyle.width,textStyle.scale,textStyle.scale,angle);
	}
	
	function DrawOutline() {
		draw_set_color(textStyle.outlineColor);
		DrawText(x+1,y);
		DrawText(x,y+1);
		DrawText(x,y-1);
		DrawText(x-1,y);
	}
	
	function DrawShadow() {
		draw_set_color(textStyle.outlineColor);
		DrawText(x+textStyle.shadowOffset.x,y+textStyle.shadowOffset.y);
	}
}








