///@desc The "Life-Steal" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

if (dsBuff[? BUFF_MAP.CLOCK] <= 0) exit;

var list = dsBuff[? "players_hit"];

var index = 0;
for (var i = 0; i < ds_list_size(list); i++) {
	var map = list[| i];
	var img = ceil(map[? "image_index"]);
	if (img >= dsBuff[? "image_index_max"])
		ds_list_delete(list, index);
	var xx = map[? "x"];
	var yy = map[? "y"];
	var scale = point_distance(x, y, xx, yy) / 128;
	var dir = point_direction(x, y, xx, yy);
	scDrawSpriteExt(x, y, dsBuff[? "sprite"], img, noone, 0.8, scale, map[? "yscale"], dir);
	map[? "image_index"] += dsBuff[? "image_speed"];
}