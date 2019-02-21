/// @desc reflect off wall
var map = bounceMap;

//var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
map[? "vsp"] += map[? "grv"];
map[? "hsp"] += -sign(map[? "hsp"]) * map[? "frc"];


var colx = false;
var inst = collision_point(x + map[? "hsp"], y, oWall, true, false);
if (inst != noone && inst.object_index != oSeperator) {
	map[? "hsp"] /= -1.5;
	colx = true;
}

inst = collision_point(x, y + map[? "vsp"], oWall, true, false);
if (inst != noone && inst.object_index != oSeperator) {
	map[? "vsp"] /= -1.5;
	map[? "vsp"] /= 1.05;
}
	
x += map[? "hsp"];
y += map[? "vsp"];
direction = point_direction(x, y, x + map[? "hsp"], y + map[? "vsp"]);
image_angle = direction;