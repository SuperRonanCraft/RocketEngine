//DRAW PLAYER WEAPON/ULTIMATE
var map = weapon_map;
if (map[? WEAPON_MAP.TYPE] != WEAPON.NONE) {
	//The projectile sprite
	//var sprite = map[? WEAPON_MAP.GUI_ICON];
	var sprite = s_modifier_default; //scWeaponModifyGetType(map[? WEAPON_MAP.TYPE], WEAPON_MODIFIER_MAP.ICON);
	//Dimentions of sprite
	var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	//determine side
	var xpos = team == TEAM.LEFT ? RES_W / 4 - w / 3 : RES_W / 2 + RES_W / 4 + w / 3;
	var ypos = h / 2;
	
	var c = c_dkgray;
	for (var i = 0; i < ds_list_size(buffs_map); i++) {
		//Grab the buff map
		var ds_list = buffs_map[| i];
		//Is the buff a cooldown?
		if (ds_list[? BUFF_MAP.TYPE] == BUFFTYPE.COOLDOWN)
			c = c_green;
	}
	//Buff of the weapon
	if (map[? WEAPON_MAP.GUI_BUFFS] != noone) {
		var buffsid = map[? WEAPON_MAP.GUI_BUFFS];
		var buffy = RES_H / 16;
		var buffx = xpos + (team == TEAM.LEFT ? 32 : -50);
		if (is_array(buffsid))
			for (var i = 0; i < array_length_1d(buffsid); i++) {
				var buff_map = ds_map_create();
				scBuffGet(buffsid[i], buff_map);
				if (buff_map[? BUFF_MAP.ENABLED]) {
					draw_sprite_ext(buff_map[? BUFF_MAP.ICON], 0, buffx, buffy, 0.3, 0.3, 0, c_white, map[? WEAPON_MAP.ENABLED] ? 0.5 : 0.2);
					buffx += (team == TEAM.LEFT ? 22 : -22);
				}
				ds_map_destroy(buff_map);
			}
		else {
			var buff_map = ds_map_create();
			scBuffGet(buffsid, buff_map);
			draw_sprite_ext(buff_map[? BUFF_MAP.ICON], 0, buffx, buffy, 0.3, 0.3, 0, c_white, map[? WEAPON_MAP.ENABLED] ? 0.5 : 0.2);
			ds_map_destroy(buff_map);
		}
	}
	
	var xposcir = xpos + (team == TEAM.LEFT ? -(w / 8) : (w / 8));
	
	//WEAPON COOLDOWN
	if (map[? WEAPON_MAP.ENABLED] && global.play) {
		var cd = map[? WEAPON_MAP.AMMO] == 0 ? map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] : map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL];
		var curr_cd = map[? WEAPON_MAP.AMMO] == 0 ? map[? WEAPON_MAP.RELOAD_TIME] : map[? WEAPON_MAP.COOLDOWN_TIME];
		scDrawPie(xposcir, ypos, curr_cd, cd, c, 20, 0.8);
	}
	
	//ULTIMATE CHARGE CIRCLE
	if (ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED]) {
		var charge = round(ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE] * (100 / ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MAX]));
		if (charge >= 100) {
			var ang = irandom_range(0, 360);
			scDrawLightning(xposcir, ypos, xposcir + lengthdir_x(32, ang), ypos + lengthdir_y(32, ang), irandom(5), c_blue);
		}
		var c = make_color_rgb(255 * clamp(min(((75 - charge) / 25), 1), 0, 1), 255 * clamp(max((charge - 25) / 100, 0), 0, 1), 0);
		scDrawPiePart(xposcir, ypos, ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE], ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MAX], c, 28, 0.8, 9);
	
		//ULTIMATE CASTTIME CIRCLE
		scDrawPiePart(xposcir, ypos, ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL] - ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME], ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL], c_yellow, 32, 0.9, 4);
	
		//ULTIMATE CHARGE TEXT
		scDrawText(xposcir, ypos * 2, string(charge) + "%", charge < 100 ?  c_ltgray : c_yellow,
			0.5, noone, charge < 100 ? 0.8 : scMovementWave(0.8, 0.4, 1));
		if (charge >= 100) {
			var gamepad = !controller_lastused ? GAMEPAD_TYPE.KEYBOARD : scSettingsGetType(SETTINGS_TYPE.VALUE, key_map[? KEYBIND_MAP.GAMEPAD_TYPE]);
			var scale = 2.5;
			var ultypos = ypos;
			var c = c_white;
			if (gamepad == GAMEPAD_TYPE.KEYBOARD) {
				scale = 0.5;
				ultypos = ultypos * 1.8 + (string_height(scKeyToString(key_map[? KEYBIND_MAP.ULTIMATE])) * scale);
				c = c_yellow;
			} else
				ultypos = ultypos * 2.8;
			scUIGamepadDraw(gamepad, !controller_lastused ? key_map[? KEYBIND_MAP.ULTIMATE] : key_map[? KEYBIND_MAP.ULTIMATE_GP], xposcir, ultypos, c, scale, 1 /*scMovementWave(0.8, 0.4, 1)*/, fa_middle, fa_top);
			/*var str = scKeyToString(key_map[? KEYBIND_MAP.ULTIMATE]);
			scDrawText(xposcir, ypos * 2 + (string_height(str) * 0.5), str, c_yellow, 
				0.5, noone, scMovementWave(0.8, 0.4, 1));*/
		}
	}
	
	//WEAPON SPRITE EQUIPPED
	var scale = map[? WEAPON_MAP.GUI_WEAPON_SCALE];
	var xpos = xpos + ((team == TEAM.LEFT ? -1 : 1) * (w / 2))
	draw_sprite_ext(sprite, 0, xpos + ((scale) / 4), ypos - (h / 4) + ((h * scale) / 4), scale / 2, scale / 2, 0, 
		c_white, map[? WEAPON_MAP.ENABLED] ? 0.8 : 0.3);
	//Make the scale smaller over time
	map[? WEAPON_MAP.GUI_WEAPON_SCALE] = max(map[? WEAPON_MAP.GUI_WEAPON_SCALE] * 0.95, 1);
}