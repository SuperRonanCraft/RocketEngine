/// @arg mode (0 = 1 v 1, 1 = 1 v ai, 2 ai v ai)
function scPlayerLoadPrevious(_mode) {
	//Load previous skins
	var _amt = instance_number(oPlayer);
	for (var i = 0; i < _amt; i++) {
		var player = instance_find(oPlayer, i);
		with (player) {
			if (i == 0 && global.last_character_p1 == noone && !player_aimode)
				continue;
			else if (i == 1 && global.last_character_p2 == noone && !player_aimode)
				continue;
			var _char = i == 0 ? global.last_character_p1 : global.last_character_p2;
			var _pallet = i == 0 ? global.last_pallet_p1 : global.last_pallet_p2;
			
			if (_mode == 0 || (_mode == 1 && team == TEAM.LEFT)) {
				scPlayerCharacterChange(_char, false);
				var map = player_map[? PLAYER_MAP.CHARACTER_INFO]
				var val = _pallet;
				if (val < sprite_get_width(map[? CHARACTER_MAP.PALETTE])) {
					scPlayerCharacterPaletteChange(val);
					map[? CHARACTER_MAP.PALETTE_INDEX] = val;
				}
			} else if (_mode == 2 || team == TEAM.RIGHT) { //Random 
				scPlayerCharacterChange(irandom(CHARACTER.LENGTH - 1), false);
				var map = player_map[? PLAYER_MAP.CHARACTER_INFO]
				var val = irandom(sprite_get_width(map[? CHARACTER_MAP.PALETTE]) - 1);
				scPlayerCharacterPaletteChange(val);
				map[? CHARACTER_MAP.PALETTE_INDEX] = val;
			}
		}
	}

}