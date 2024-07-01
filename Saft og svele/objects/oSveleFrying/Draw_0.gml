draw_set_alpha(1)




draw_sprite(sprite_index,stage,x,y)
draw_set_alpha(alpha)
draw_sprite(sprite_index,stage+1,x,y)
draw_set_alpha(1)

alpha += 0.01;

if (alpha >= 1) {
	alpha = 0;
	stage++;
}
if (stage == 5) stage = 0;
//stage = clamp(stage,0,5)