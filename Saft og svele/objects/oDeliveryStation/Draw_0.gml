
//sveleStack.Draw(x,y+54);
/*
for (var i = 0; i < ds_list_size(sveleStacks); ++i) {
	sveleStacks[|i].Draw(x-(i*10),y+54);
}*/

if (!sveleStack1.Empty()) {
	draw_sprite(sPlate,0,xstart+xStack1,y);
	sveleStack1.Draw(xstart+xStack1,y+54);
	xStack1 += 1;
	
	if (xStack1 + xstart > room_width + 50) {
		xStack1 = 0;
		sveleStack1.Destroy();
	}
	
}

if (!sveleStack2.Empty()) {
	draw_sprite(sPlate,0,xstart+xStack2,y);
	sveleStack2.Draw(xstart+xStack2,y+54);
	xStack2 += 1;
	
	if (xStack2 + xstart > room_width+ 50) {
		xStack2 = 0;
		sveleStack2.Destroy();
	}
}










