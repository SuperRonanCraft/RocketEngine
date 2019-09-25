with (player) {
	var map = player_map[? PLAYER_MAP.CHARACTER_INFO]
	var val = map[? CHARACTER_MAP.PALETTE_INDEX];
	val--;
	if (val >= 0) {
		scPlayerCharacterPaletteChange(val);
		//map[? CHARACTER_MAP.PALETTE_INDEX] = val;
		other.char_palette = val;
	}
}