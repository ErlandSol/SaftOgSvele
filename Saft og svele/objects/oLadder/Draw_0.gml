draw_self();


if canDraw && (instance_position(mouse_x,mouse_y,id)) {

	draw_set_color(c_black);

	if (centreNodeTop != none) {
		draw_circle(centreNodeTop.x,centreNodeTop.y,4,false);
	}

	if (centreNodeBottom != none) {
		draw_circle(centreNodeBottom.x,centreNodeBottom.y,4,false);
	}

	draw_line_width_color(x,y,x,y+sprite_height,1,colorTop,colorBottom);

	draw_set_color(colorTop);
	if (closestNodeTopLeft != none) {
		draw_circle(closestNodeTopLeft.x,closestNodeTopLeft.y,4,false);
		draw_arrow_width(x,y,closestNodeTopLeft.x,closestNodeTopLeft.y,1,8);
	}
	
	if (closestNodeTopRight != none) {
		draw_circle(closestNodeTopRight.x,closestNodeTopRight.y,4,false);
		draw_arrow_width(x,y,closestNodeTopRight.x,closestNodeTopRight.y,1,8);
	}
	
	if (centreNodeBottom == none) {
		draw_set_color(colorBottom);
		if (closestNodeBottomLeft != none) {
			draw_circle(closestNodeBottomLeft.x,closestNodeBottomLeft.y,4,false);
			draw_arrow_width(x,y+sprite_height,closestNodeBottomLeft.x,closestNodeBottomLeft.y,1,8);
		}

		if (closestNodeBottomRight != none) {
			draw_circle(closestNodeBottomRight.x,closestNodeBottomRight.y,4,false);
			draw_arrow_width(x,y+sprite_height,closestNodeBottomRight.x,closestNodeBottomRight.y,1,8);
		}
	}

	draw_set_color(c_white);
}










