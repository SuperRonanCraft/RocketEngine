function scAllowCharacterSelect() {
	timer_enabled = false; //Character Select enables this
	var amt = instance_number(oPlayer);
	for (var i = 0; i < amt; i++) {
		with (instance_create_depth(0, 0, depth - 1, oUICharacterSelect)) {
			switch (amt) {
				case 2: //2 Players
					switch (i) {
						case 0:
							start_x_default /= 2;
							break;
						case 1:
							start_x_default *= 1.5;
							break;
					}
					player = instance_find(oPlayer, i);
					if (player.player_aimode) { //Super HARDCODED MENU STUFF this will super break if ai stuff changes for character select
						scUICharacterAccept(true);
						page_workingon = page;
						scale_option[0] = scale_main;
						start_y[0] = start_y_default + (-(((5 - 1) / 2) * y_buffer) + (0 * y_buffer));
						start_x[0] = start_x_default;
						centered = true;
					}
					button_down = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.SHOOT]);
					button_left = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.LEFT]);
					button_up = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.JUMP]);
					button_right = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.RIGHT]);
					button_gamepad = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.GAMEPAD]);
					if (i mod 2 == 1)
						char_dir *= -1;
					break;
				case 3:
				case 4:
					switch (i) {
						case 0:
							start_x_default /= 2;
							start_y_default /= 1.2;
							view_side = 1;
							break;
						case 1:
							start_x_default *= 1.5;
							start_y_default /= 1.2;
							view_side = -1;
							break;
						case 2:
							start_x_default /= 2;
							start_y_default *= 1.4;
							view_side = 1;
							break;
						case 3:
							start_x_default *= 1.5;
							start_y_default *= 1.4;
							view_side = -1;
							break;
					}
					view_under = false;
					player = instance_find(oPlayer, i);
					switch (i) {
						case 0:
						case 1:
							button_down = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.SHOOT]);
							button_left = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.LEFT]);
							button_up = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.JUMP]);
							button_right = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.RIGHT]);
							break;
						case 2:
						case 3:
							button_gamepad_only = true;
							break;
						default:
							break;
					}
					button_gamepad = scSettingsGetType(SETTINGS_TYPE.VALUE, player.key_map[? KEYBIND_MAP.GAMEPAD]);
					if (i mod 2 == 1)
						char_dir *= -1;
					break;
				default: //1 Player
					break;
			}
		}
	}


}
