/// @desc reflect off wall
var map = brickMap;

//var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
var side = direction > 90 && direction < 270 ? -1 : 1;
map[? "vsp"] += map[? "grv"] * owner.time_dialation;
map[? "hsp"] += (sign(map[? "hsp"]) * map[? "acc"]) * owner.time_dialation;
if (sign(map[? "hsp"]) != sign(side))
	map[? "hsp"] *= -1;

//Bounce off wall
var inst = instance_place(x + map[? "hsp"], y, oWall);
if (inst != noone && inst.object_index != oSeperator) {
	if (map[? "hsp"] > 0) //Going Right
		x = floor(inst.bbox_left + (x - bbox_right) - 1);
	else if (map[? "hsp"] < 0) //Going Left
		x = ceil(inst.bbox_right + (x - bbox_left) + 1);
	map[? "hsp"] = 0;
}

//Slide on floor
var coly = false;
inst = instance_place(x, y + map[? "vsp"], oWall);
if (inst != noone && inst.object_index != oSeperator) {
	if (map[? "vsp"] > 0) //Falling
		y = floor(inst.bbox_top + (y - bbox_bottom) - 1);
	else if (map[? "vsp"] < 0) //Going up
		y = ceil(inst.bbox_bottom + (y - bbox_top) + 1);
	map[? "vsp"] = 0;
	map[? "touching_floor"] = true;
} else
	map[? "touching_floor"] = false;
	
x += map[? "hsp"] * owner.time_dialation;
y += map[? "vsp"] * owner.time_dialation;
image_angle = direction;

if (map[? "hsp"] == 0 && map[? "vsp"] == 0)
	event_user(0);
