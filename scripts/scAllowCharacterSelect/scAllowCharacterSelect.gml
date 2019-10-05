timer_enabled = false; //Character Select enables this
var amt = instance_number(oPlayer);
for (var i = 0; i < amt; i++) {
	with (instance_create_depth(0, 0, depth - 1, oUICharacterSelect)) {
		switch (amt) {
			case 2:
				switch (i) {
					case 0:
						start_x_default /= 2;
						break;
					case 1:
						start_x_default *= 1.5;
						break;
				}
				player = instance_find(oPlayer, i);
				button_down = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.SHOOT]);
				button_left = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.LEFT]);
				button_up = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.JUMP]);
				button_right = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.RIGHT]);
				button_gamepad = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.GAMEPAD]);
			default:
				break;
		}
	}
}