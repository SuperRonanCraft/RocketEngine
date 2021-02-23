///@desc Display keybinds
function scMenuControls(argument0) {
	var gamepad = argument0;

	var rad = 10, width = 35;
	var up_x = RES_W / 4, down_x = up_x, left_x = up_x - 110, right_x = up_x + 110; //X Values
	var up_y = RES_W / 4, down_y = up_y + 110, left_y = down_y, right_y = down_y; //Y Values
	var btn_x, btn_y, scale = 1, btn_reason;
	//Keybinds
	for (var a = 0; a < 2; a++) { //Playerid
		scDrawText(a == 0 ? up_x : up_x + RES_W / 2, up_y - width - 50, a == 0 ? "Player 1" : "Player 2", color_element_special, scale_main); //Player side
		for (var i = 0; i < 6; i++) { //Amount of btns
			switch (i) { //btn x/y, reason and id
					case 0: btn_x = up_x; btn_y = up_y; btn_reason = "JUMP"; break;
					case 1: btn_x = down_x; btn_y = down_y; btn_reason = "SHOOT"; break;
					case 2: btn_x = left_x; btn_y = left_y; btn_reason = "LEFT"; break;
					case 3: btn_x = right_x; btn_y = right_y; btn_reason = "RIGHT"; break;
					case 4: btn_x = left_x; btn_y = left_y + 150; btn_reason = "ULTIMATE"; break;
					case 5: btn_x = right_x; btn_y = left_y + 150; btn_reason = "ABILITY"; break;
				}
			var btn_x = (a == 0 ? btn_x : btn_x + RES_W / 2);
			draw_roundrect_color_ext(btn_x + width, btn_y + width, btn_x - width, btn_y - width, rad, rad, c_black, c_black, true);
			var key = noone;
			var key_value = 0;
			if (gamepad == GAMEPAD_TYPE.KEYBOARD) {
				scale = 0.7;
				switch (i) { //btn x/y, reason and id
					case 0: key = a == 0 ? SETTINGS.PLAYER_1_JUMP : SETTINGS.PLAYER_2_JUMP; break;
					case 1: key = a == 0 ? SETTINGS.PLAYER_1_SHOOT : SETTINGS.PLAYER_2_SHOOT; break;
					case 2: key = a == 0 ? SETTINGS.PLAYER_1_LEFT : SETTINGS.PLAYER_2_LEFT; break;
					case 3: key = a == 0 ? SETTINGS.PLAYER_1_RIGHT : SETTINGS.PLAYER_2_RIGHT; break;
					case 4: key = a == 0 ? SETTINGS.PLAYER_1_ULTIMATE : SETTINGS.PLAYER_2_ULTIMATE; break;
					case 5: key = a == 0 ? SETTINGS.PLAYER_1_ABILITY : SETTINGS.PLAYER_2_ABILITY; break;
				}
				key_value = keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, key));
			} else {
				scale = 1.5;
				switch (i) { //btn x/y, reason and id
					case 0: key = a == 0 ? SETTINGS.PLAYER_1_JUMP_GP : SETTINGS.PLAYER_2_JUMP_GP; break;
					case 1: key = a == 0 ? SETTINGS.PLAYER_1_SHOOT_GP : SETTINGS.PLAYER_2_SHOOT_GP; break;
					case 2: key = a == 0 ? SETTINGS.PLAYER_1_LEFT_GP : SETTINGS.PLAYER_2_LEFT_GP; break;
					case 3: key = a == 0 ? SETTINGS.PLAYER_1_RIGHT_GP : SETTINGS.PLAYER_2_RIGHT_GP; break;
					case 4: key = a == 0 ? SETTINGS.PLAYER_1_ULTIMATE_GP : SETTINGS.PLAYER_2_ULTIMATE_GP; break;
					case 5: key = a == 0 ? SETTINGS.PLAYER_1_ABILITY_GP : SETTINGS.PLAYER_2_ABILITY_GP; break;
				}
				key_value = gamepad_button_check(0, scSettingsGetType(SETTINGS_TYPE.VALUE, key));
			}
			scDrawText(btn_x, btn_y - width - 10, btn_reason, color_element, 0.7); //Button reason
			if (key_value != 0) {
				scale *= 1.3;
				btn_x += scMovementWave(-3, 3, 1);
			}
			scUIGamepadDraw(gamepad, key, btn_x, btn_y, noone, scale);
		}
	}


}
