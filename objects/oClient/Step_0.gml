/// @desc 
if (keyboard_check_pressed(vk_space)) {
	with (oPlayer) {
		if (local_player) {
			var _map = player_map[? PLAYER_MAP.CHARACTER_INFO];
			var char = _map[? CHARACTER_MAP.TYPE];
			char++;
			if (char >= CHARACTER.LENGTH)
				char = 0;
			scPlayerCharacterChange(char, false);
		}
	}
}