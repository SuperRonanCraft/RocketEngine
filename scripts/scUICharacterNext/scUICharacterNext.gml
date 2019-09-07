with (player) {
	var val = player_map[? PLAYER_MAP.CHARACTER];
	val++;
	if (val >= CHARACTERS.LENGTH)
		val = 0;
	player_map[? PLAYER_MAP.CHARACTER] = val;
	scCharacterSprites();
}