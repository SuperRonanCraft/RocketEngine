function scUIPaletteNext() {
	with (player) {
		var map = player_map[? PLAYER_MAP.CHARACTER_INFO]
		var val = map[? CHARACTER_MAP.PALETTE_INDEX] + 1;
		if (val < sprite_get_width(map[? CHARACTER_MAP.PALETTE])) {
			scPlayerCharacterPaletteChange(val);
			//map[? CHARACTER_MAP.PALETTE_INDEX] = val;
			other.char_palette = val;
		}
	}


}
