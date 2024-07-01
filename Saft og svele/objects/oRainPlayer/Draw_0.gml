


if (invincible) && (flash) image_alpha = 0.5 else image_alpha = 1
if (!isDown)  { 
	draw_self();
	draw_sprite(sArrow,0,x,0);	
}
//draw_set_alpha(1);

sveleStack.Draw(x,y,xSpeed);

draw_set_font(fontConnectQuest2);
if (scoreTimer > 0) {
	scoreText.SetOpacityOverride(scoreTextOpacity);
	scoreText.Draw(x,y-64-sveleStack.GetHeight());
	scoreTextOpacity -= 0.02;
	scoreText.SetOpacityOverride(1);
}
else {
	scoreTextOpacity = 1;
}





testText.SetText(score);
testText.Draw(50,50);
healthText.Draw(50,30,speedMultiplier)
