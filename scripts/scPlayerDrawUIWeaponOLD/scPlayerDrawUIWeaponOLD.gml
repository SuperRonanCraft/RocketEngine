//DRAW PLAYER WEAPON/ULTIMATE
///@arg x
///@arg y
///@arg radius
///@arg frame-width

var map = weapon_map;
var _x = argument0;
var _y = argument1;
var _rad = argument2;
var _rad_frame = argument3;
_x += _rad;
if (map[? WEAPON_MAP.TYPE] != WEAPON.NONE) {
	//The projectile sprite
	//var sprite = map[? WEAPON_MAP.GUI_ICON];
	var sprite = scWeaponModifyGetType(map[? WEAPON_MAP.MODIFIER], WEAPON_MODIFIER_MAP.ICON);
	//Dimentions of sprite
	//var w = sprite_get_width(sprite);
	var h = sprite_get_height(sprite);
	//determine side
	var xpos = team == TEAM.LEFT ? _x : RES_W - _x;
	var ypos = h / 1.8;
	
	var c = c_dkgray;
	
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
	
	//var xposcir = xpos + (team == TEAM.LEFT ? -(w / 8) : (w / 8));
	
	//ULTIMATE CHARGE CIRCLE
	if (system_ultimate && ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED]) {
		var charge = ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE] * (100 / ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MAX]);
		if (charge >= 100) {
			var ang = irandom_range(0, 360);
			scDrawLightning(xpos, ypos, xpos + lengthdir_x(32, ang), ypos + lengthdir_y(32, ang), irandom(5), c_blue);
		}
		//ypos = 0;
		//var _rad = 30, _rad_width = 30, _rad_frame = 3;
		scDrawPiePart(xpos, ypos, 1, 1, c_gray, _rad + _rad_frame, 0.8, _rad + _rad_frame, 90);
		//var c = make_color_rgb(255 * clamp(min(((75 - charge) / 25), 1), 0, 1), 255 * clamp(max((charge - 25) / 100, 0), 0, 1), 0);
		var c = charge >= 100 ? c_green : c_yellow; 
		scDrawPiePart(xpos, ypos, ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE], ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MAX], c, _rad, 0.8, _rad, 90);
	
		//ULTIMATE CASTTIME CIRCLE
		scDrawPiePart(xpos, ypos, ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL] - ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME], ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL], c_yellow, 32, 0.9, 4);
	
		//ULTIMATE CHARGE TEXT
		scDrawText(xpos, ypos + _rad + _rad_frame, string(charge < 100 ? floor(charge) : round(charge)) + "%", charge < 100 ?  c_ltgray : c_yellow,
			0.5, noone, charge < 100 ? 0.8 : scMovementWave(0.8, 0.4, 1));
		if (charge >= 100) {
			var gamepad = !controller_lastused ? GAMEPAD_TYPE.KEYBOARD : GAMEPAD_TYPE.PS4;//scSettingsGetType(SETTINGS_TYPE.VALUE, key_map[? KEYBIND_MAP.GAMEPAD]); //Get the gamepad index
			var scale = 1;
			var ultypos = ypos + _rad + _rad_frame;
			var c = c_white;
			if (gamepad == GAMEPAD_TYPE.KEYBOARD) { //No Gamepad
				scale = 0.5;
				ultypos = ultypos + (string_height(scKeyToString(key_map[? KEYBIND_MAP.ULTIMATE])) * scale);
				c = c_yellow;
			} else
				ultypos = ultypos + _rad + _rad_frame;
			scUIGamepadDraw(gamepad, !controller_lastused ? key_map[? KEYBIND_MAP.ULTIMATE] : key_map[? KEYBIND_MAP.ULTIMATE_GP], xpos, ultypos, c, scale, 1);
			/*var str = scKeyToString(key_map[? KEYBIND_MAP.ULTIMATE]);
			scDrawText(xposcir, ypos * 2 + (string_height(str) * 0.5), str, c_yellow, 
				0.5, noone, scMovementWave(0.8, 0.4, 1));*/
		}
	}
	
	//WEAPON COOLDOWN
	if (map[? WEAPON_MAP.ENABLED] && global.play) {
		var cd = map[? WEAPON_MAP.AMMO] == 0 ? map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] : map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL];
		var curr_cd = map[? WEAPON_MAP.AMMO] == 0 ? map[? WEAPON_MAP.RELOAD_TIME] : map[? WEAPON_MAP.COOLDOWN_TIME];
		var c = c_dkgray;
		if (!map[? WEAPON_MAP.CHARGING])
			for (var i = 0; i < ds_list_size(buffs_map); i++) {
				//Grab the buff map
				var ds_list = buffs_map[| i];
				//Is the buff a cooldown?
				if (ds_list[? BUFF_MAP.TYPE] == BUFFTYPE.COOLDOWN)
					c = c_blue;
			}
		else {
			c = c_purple;
			cd = 1;
			curr_cd = map[? WEAPON_MAP.CHARGE];
		}
		
		scDrawPieRect(xpos, ypos, curr_cd, cd, c, 20, 0.8);
	}
	
	//WEAPON SPRITE EQUIPPED
	var scale = map[? WEAPON_MAP.GUI_WEAPON_SCALE];
	//var xpos = xpos + ((team == TEAM.LEFT ? -1 : 1) * (w / 2))
	draw_sprite_ext(sprite, 0, xpos, ypos, scale / 2, scale / 2, 0, c_white, map[? WEAPON_MAP.ENABLED] ? 0.8 : 0.3);
	//Make the scale smaller over time
	map[? WEAPON_MAP.GUI_WEAPON_SCALE] = max(map[? WEAPON_MAP.GUI_WEAPON_SCALE] * 0.95, 1);
}