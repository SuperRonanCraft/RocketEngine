with (player) {
	var map = player_map[? PLAYER_MAP.CHARACTER_INFO]
	var val = map[? CHARACTER_MAP.TYPE];
	val--;
	if (val < 0)
		val = CHARACTERS.LENGTH - 1;
	scPlayerCharacterChange(val);
	scCharacterSprites();
}