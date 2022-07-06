/// @description  
if(owner != undefined && instance_exists(owner)){
	var char_info = owner.player_map[? PLAYER_MAP.CHARACTER_INFO];
	scPalleteSwapSet(char_info[? CHARACTER_MAP.PALETTE], char_info[? CHARACTER_MAP.PALETTE_INDEX]);
	scPalleteSwapReset();
}

scPalleteSwapReset();
