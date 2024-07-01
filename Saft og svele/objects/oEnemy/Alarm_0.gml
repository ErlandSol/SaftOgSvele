
alarm[0] = 60;
UpdatePath(kickstart || (WithinRange(currentNode.x,x,4) && WithinRange(currentNode.y,y,1)));
kickstart = false;
/*
/// @description Reset fall
moveState = MoveStates.walking;
sprite_index = sEnemy;
*/