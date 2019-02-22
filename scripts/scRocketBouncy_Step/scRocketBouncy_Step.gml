/// @desc reflect off wall
var map = bounceMap;

//var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
map[? "vsp"] += map[? "grv"] * owner.time_dialation;
map[? "hsp"] += (-sign(map[? "hsp"]) * map[? "frc"]) * owner.time_dialation;

//Bounce off wall
var inst = collision_point(x + map[? "hsp"], y, oWall, true, false);
if (inst != noone && inst.object_index != oSeperator)
	map[? "hsp"] /= -1.5;

//Bounce off floor
var coly = false;
inst = collision_point(x, y + map[? "vsp"], oWall, true, false);
if (inst != noone && inst.object_index != oSeperator) {
	map[? "vsp"] /= -1.5;
	coly = true;
}
	
x += map[? "hsp"] * owner.time_dialation;
y += map[? "vsp"] * owner.time_dialation;
direction = point_direction(x, y, x + map[? "hsp"], y + map[? "vsp"]);
image_angle = direction;

//Explode if jumping too low
if (coly && map[? "vsp"] < 0 && map[? "vsp"] > -2)
	event_user(0);
