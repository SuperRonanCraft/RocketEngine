/// @description  

if (sprite_index != noone) {
	if(owner != undefined && instance_exists(owner)){
		var char_info = owner.player_map[? PLAYER_MAP.CHARACTER_INFO];
		scPalleteSwapSet(char_info[? CHARACTER_MAP.PALETTE], char_info[? CHARACTER_MAP.PALETTE_INDEX]);
	}
	draw_self();
	scPalleteSwapReset();
}

//Show shuriken collision box while in debug mode
if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);