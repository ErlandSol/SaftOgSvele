
draw_self();
/*
var size = ds_list_size(sveleContentsSprite);
var overallMoveMultiplier = size/50;
if (size > 0) {
	for (var i = 0; i < size; i++) {
		var b = overallMoveMultiplier * ((i > 4) ? i/size : 0);
	    if (sveleContentsSprite[|i] != -1) draw_sprite(sveleContentsSprite[|i],0,x+drawOffsets[|i]-xSpeed*(b),y-47-(4*i))
	}
}
*/


/*
if (ds_list_find_index(sveleContentsSprite,sSvele) != -1)	{ draw_sprite(sSvele,0,x,y-45-0) }

var size = ds_list_size(sveleContentsSprite);
var overallMoveMultiplier = size/50;
if (size > 5) {
	for (var i = 5; i < size; i++) {
		var b = overallMoveMultiplier * ((i > 9) ? i/size : 0);
	    if (sveleContentsSprite[|i] != -1) draw_sprite(sveleContentsSprite[|i],0,x+drawOffsets[|i]-xSpeed*(b),y-40-(1*i))
	}
}
*/

//if (ds_list_find_index(sveleContentsSprite,sSvele) != -1)	{ draw_sprite(sSvele,0,x,y-45-0) }



var size = ds_list_size(sveleList);
if (!ds_list_empty(sveleList)) {
	for (var i = 0; i < size; i++) {
		draw_sprite(sveleList[|i],0,x+drawOffsets[|i].x,y-48-(4*i))
	}
}

var topOffset = 44 + size*4;

if (ds_list_find_index(sveleContentsSprite,sSourCream) != -1)	{ draw_sprite(sSourCream,0,x,y-topOffset-1) }
if (ds_list_find_index(sveleContentsSprite,sGulost) != -1)		{ draw_sprite(sGulost,0,x,y-topOffset-3)	}
if (ds_list_find_index(sveleContentsSprite,sBrunost) != -1)		{ draw_sprite(sBrunost,0,x,y-topOffset-4)	}
if (ds_list_find_index(sveleContentsSprite,sJam) != -1)			{ draw_sprite(sJam,0,x,y-topOffset-4)		}
if (ds_list_find_index(sveleContentsSprite,sBerries) != -1)		{ draw_sprite(sBerries,0,x,y-topOffset-5)	}


draw_set_font(fontConnectQuest2);
if (scoreTimer > 0) {
	scoreText.Draw();
}




testText.SetShadow(false);
testText.SetOutline(false);
testText.Draw(50,50);

testText.SetShadow(true);
testText.Draw(100,50);

testText.SetShadow(false);
testText.SetOutline(true);
testText.Draw(150,50);

testText.SetShadow(true);
testText.SetOutline(true);
testText.Draw(200,50);
