//DRAW PLAYER WEAPON/ULTIMATE
var map = weapon_map;
var rocket_map = map[? WEAPON_MAP.MAP];
if (rocket_map[? ROCKET_MAP.TYPE] != ROCKET.NONE) {
	//The projectile sprite
	var sprite = rocket_map[? ROCKET_MAP.PROJECTILE];
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
	//Buff of the rocket
	if (rocket_map[? ROCKET_MAP.BUFF] != noone) {
		var buffsid = rocket_map[? ROCKET_MAP.BUFF];
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
	
	//ROCKET COOLDOWN
	if (map[? WEAPON_MAP.ENABLED]) {
		var cd = map[? WEAPON_MAP.AMMO] == 0 ? rocket_map[? ROCKET_MAP.RELOAD_TIME] : rocket_map[? ROCKET_MAP.COOLDOWN];
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
		scDrawPiePart(xposcir, ypos, ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX] - ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME], ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX], c_yellow, 32, 0.9, 4);
	
		//ULTIMATE CHARGE TEXT
		scDrawText(xposcir, ypos * 2, string(charge) + "%", charge < 100 ?  c_ltgray : c_yellow,
			0.5, noone, charge < 100 ? 0.8 : scMovementWave(0.8, 0.4, 1));
		if (charge >= 100) {
			var str = scKeyToString(keyleft) + " + " + scKeyToString(keyright);
			scDrawText(xposcir, ypos * 2 + (string_height(str) * 0.5), str, c_yellow, 
				0.5, noone, scMovementWave(0.8, 0.4, 1));
		}
	}
	//ROCKET EQUIPPED
	var scale = map[? WEAPON_MAP.GUI_WEAPON_SCALE];
	draw_sprite_ext(sprite, 0, xpos, ypos, (team == TEAM.LEFT ? 1 : -1) * scale, 1 * scale, 0, 
		c_white, map[? WEAPON_MAP.ENABLED] ? 0.8 : 0.3);
	//Make the scale smaller over time
	map[? WEAPON_MAP.GUI_WEAPON_SCALE] = max(scale * 0.95, 1);
}