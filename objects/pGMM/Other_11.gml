/// @desc End the game (called from scHitShootable when a player hp <= 0) and when timer reaches 0
endgame = true;
//Remove the ability to do damage
for (var i = 0; i < ds_list_size(p_list); i++) {
	var p = p_list[| i];
	//Current rocket
	p.rocket_map[? ROCKET_MAP.DAMAGE] = -1;
	//All rockets
	for (var a = 0; a < array_length_1d(p.weapons); a++)
		ds_map_set(p.weapons[a], ROCKET_MAP.DAMAGE, -1);
}
//End game sound...
//audio_play_sound(SOUND.GP_ENDGAME, 1, false);