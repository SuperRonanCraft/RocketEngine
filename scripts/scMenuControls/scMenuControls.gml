var rad = 10, width = 35;
var up_x = RES_W / 4, down_x = up_x, left_x = up_x - 110, right_x = up_x + 110; //X Values
var up_y = RES_W / 4, down_y = up_y + 110, left_y = down_y, right_y = down_y; //Y Values
var btn_x, btn_y, btn, btn_reason;
//Keybinds
for (var a = 0; a < 2; a++) { //Playerid
	scDrawText(a == 0 ? up_x : up_x + RES_W / 2, up_y - width - 50, a == 0 ? "Player 1" : "Player 2", color_element_special, scale_main); //Player side
	for (var i = 0; i < 6; i++) { //Amount of btns
		switch (i) { //btn x/y, reason and id
			case 0: btn_x = up_x; btn_y = up_y; btn = (a == 0 ? scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_JUMP) : 
				scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_JUMP)); btn_reason = "JUMP"; break;
			case 1: btn_x = down_x; btn_y = down_y; btn = (a == 0 ? scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_SHOOT) : 
				scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_SHOOT)); btn_reason = "SHOOT"; break;
			case 2: btn_x = left_x; btn_y = left_y; btn = (a == 0 ? scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_LEFT) : 
				scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_LEFT)); btn_reason = "LEFT"; break;
			case 3: btn_x = right_x; btn_y = right_y; btn = (a == 0 ? scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_RIGHT) : 
				scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_RIGHT)); btn_reason = "RIGHT"; break;
			case 4: btn_x = left_x; btn_y = left_y + 150; btn = (a == 0 ? scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_ULTIMATE) : 
				scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_ULTIMATE)); btn_reason = "ULTIMATE"; break;
			case 5: btn_x = right_x; btn_y = left_y + 150; btn = (a == 0 ? scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_ABILITY) : 
				scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_ABILITY)); btn_reason = "ABILITY"; break;
		}
		var btn_x = (a == 0 ? btn_x : btn_x + RES_W / 2);
		draw_roundrect_color_ext(btn_x + width, btn_y + width, btn_x - width, btn_y - width, rad, rad, c_black, c_black, true);
		var scale = 0.65;
		if (keyboard_check(btn)) scale = 0.8; //Scale up if pressing button
		scDrawText(btn_x, btn_y, scKeyToString(btn), color_element_input, scale); //Button text
		scDrawText(btn_x, btn_y - width - 10, btn_reason, color_element, 0.7); //Button reason
	}
}