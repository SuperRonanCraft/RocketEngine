function scPlayerDrawUIUltimateOLD() {
	//DRAW PLAYER WEAPON/ULTIMATE
	/*var map = weapon_map;
	if (map[? WEAPON_MAP.TYPE] != WEAPON.NONE) {
	
		//ULTIMATE CHARGE CIRCLE
		if (ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED]) {
			var charge = round(ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE] * (100 / ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MAX]));
			if (charge >= 100) {
				var ang = irandom_range(0, 360);
				scDrawLightning(xpos, ypos, xpos + lengthdir_x(32, ang), ypos + lengthdir_y(32, ang), irandom(5), c_blue);
			}
			var c = make_color_rgb(255 * clamp(min(((75 - charge) / 25), 1), 0, 1), 255 * clamp(max((charge - 25) / 100, 0), 0, 1), 0);
			scDrawPiePart(xpos, ypos, ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE], ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MAX], c, 28, 0.8, 9);
	
			//ULTIMATE CASTTIME CIRCLE
			scDrawPiePart(xpos, ypos, ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL] - ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME], ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL], c_yellow, 32, 0.9, 4);
	
			//ULTIMATE CHARGE TEXT
			scDrawText(xpos, ypos * 2, string(charge) + "%", charge < 100 ?  c_ltgray : c_yellow,
				0.5, noone, charge < 100 ? 0.8 : scMovementWave(0.8, 0.4, 1));
			if (charge >= 100) {
				var gamepad = !controller_lastused ? GAMEPAD_TYPE.KEYBOARD : GAMEPAD_TYPE.PS4;//scSettingsGetType(SETTINGS_TYPE.VALUE, key_map[? KEYBIND_MAP.GAMEPAD]); //Get the gamepad index
				var scale = 1;
				var ultypos = ypos;
				var c = c_white;
				if (gamepad == GAMEPAD_TYPE.KEYBOARD) { //No Gamepad
					scale = 0.5;
					ultypos = ultypos * 1.8 + (string_height(scKeyToString(key_map[? KEYBIND_MAP.ULTIMATE])) * scale);
					c = c_yellow;
				} else
					ultypos = ultypos * 2.8;
				scUIGamepadDraw(gamepad, !controller_lastused ? key_map[? KEYBIND_MAP.ULTIMATE] : key_map[? KEYBIND_MAP.ULTIMATE_GP], xpos, ultypos, c, scale, 1, fa_middle, fa_top);
				/*var str = scKeyToString(key_map[? KEYBIND_MAP.ULTIMATE]);
				scDrawText(xposcir, ypos * 2 + (string_height(str) * 0.5), str, c_yellow, 
					0.5, noone, scMovementWave(0.8, 0.4, 1));*/
	/*		}
		}
	
		//WEAPON SPRITE EQUIPPED
		var scale = map[? WEAPON_MAP.GUI_WEAPON_SCALE];
		//var xpos = xpos + ((team == TEAM.LEFT ? -1 : 1) * (w / 2))
		draw_sprite_ext(sprite, 0, xpos, ypos, scale / 2, scale / 2, 0, 
			c_white, map[? WEAPON_MAP.ENABLED] ? 0.8 : 0.3);
		//Make the scale smaller over time
		map[? WEAPON_MAP.GUI_WEAPON_SCALE] = max(map[? WEAPON_MAP.GUI_WEAPON_SCALE] * 0.95, 1);
	}

/* end scPlayerDrawUIUltimateOLD */
}
