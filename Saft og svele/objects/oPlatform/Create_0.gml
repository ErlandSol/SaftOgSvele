alarm[0] = 1;

nodes = ds_list_create();

ladderCount = 0;


ladders = ds_list_create();

function GetLadders() {
	var list = ds_list_create();
	ds_list_copy(list,ladders);
	return list;
}