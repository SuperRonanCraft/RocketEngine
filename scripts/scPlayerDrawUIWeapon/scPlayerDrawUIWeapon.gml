//DRAW PLAYER WEAPON/ULTIMATE
///@arg x
///@arg y
///@arg buffer
///@arg alpha

var map = weapon_map;
var _x = argument0;
var _y = argument1;
var _buffer = argument2;
var _alpha = argument3;
if (map[? WEAPON_MAP.TYPE] == WEAPON.NONE) exit;

//The projectile sprite
//var sprite = map[? WEAPON_MAP.GUI_ICON];
var sprite = scWeaponModifyGetType(map[? WEAPON_MAP.MODIFIER], WEAPON_MODIFIER_MAP.ICON);
//Dimentions of sprite
//var w = sprite_get_width(sprite);
//var h = sprite_get_height(sprite);
//determine side
var xpos = team == TEAM.LEFT ? _x : RES_W - _x - 16 - _buffer;
var ypos = _y;
var c = c_dkgray;

scDrawRect(xpos, ypos, xpos + 32 + _buffer * 2, ypos + 32 + _buffer * 2, c_gray, false, _alpha);
	
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
		
	scDrawPieRect(xpos + 16 + _buffer, ypos + 16 + _buffer, curr_cd, cd, c, 16 + _buffer, _alpha);
}

//WEAPON SPRITE EQUIPPED
var scale = map[? WEAPON_MAP.GUI_WEAPON_SCALE];
var _offset = (scale - 1) * 16;
draw_sprite_ext(sprite, 0, xpos + _buffer - _offset, ypos + _buffer - _offset, scale / 2, scale / 2, 0, c_white, map[? WEAPON_MAP.ENABLED] ? _alpha : 0.3);
//Make the scale smaller over time
map[? WEAPON_MAP.GUI_WEAPON_SCALE] = max(map[? WEAPON_MAP.GUI_WEAPON_SCALE] * 0.95, 1);