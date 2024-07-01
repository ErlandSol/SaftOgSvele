function TextAlignment() constructor {

	width = 300;
	seperation = 3;
	hAlignment = fa_left;
	vAlignment = fa_top;
		
	function SetFormatting(_hAlignment = fa_left, _vAlignment = fa_top, _seperation = 3, _width = 300) {
		hAlignment = _hAlignment;
		vAlignment = _vAlignment;
		seperation = _seperation;
		width = _width;
	}

}