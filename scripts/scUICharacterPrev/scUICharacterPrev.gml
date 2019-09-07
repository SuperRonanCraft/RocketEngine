with (player) {
	var val = player_map[? PLAYER_MAP.CHARACTER];
	val--;
	if (val < 0)
		val = CHARACTERS.LENGTH - 1;
	player_map[? PLAYER_MAP.CHARACTER] = val;
	scCharacterSprites();
}