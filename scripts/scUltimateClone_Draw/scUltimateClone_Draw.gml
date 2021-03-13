function scUltimateClone_Draw() {
	//Outline around player
	
	scFlash(0.8, c_green, (facing * image_xscale) * 1.2, image_yscale * 1.2, 
	player_map[? PLAYER_MAP.CURRENT_SPRITE], floor(player_map[? PLAYER_MAP.ANIMATION_VAR]), x, y);


}
