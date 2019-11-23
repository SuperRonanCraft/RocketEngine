with (player) {
	var map = player_map[? PLAYER_MAP.CHARACTER_INFO]
	var val = map[? CHARACTER_MAP.TYPE];
	val++;
	if (val < CHARACTER.LENGTH) {
		scPlayerCharacterChange(val);
		scPlayerLoadModifiers(id); //APPLY GAMEMODE MODIFIERS
	}
}