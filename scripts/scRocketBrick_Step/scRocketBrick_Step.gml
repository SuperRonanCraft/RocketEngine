/// @desc reflect off wall
var map = brickMap;

//var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
var side = direction > 90 && direction < 270 ? -1 : 1;
map[? "vsp"] += map[? "grv"] * owner.time_dialation;
map[? "hsp"] += (map[? "acc"] * side) * owner.time_dialation;
if (sign(map[? "hsp"]) != sign(side))
	map[? "hsp"] *= -1;

//Bounce off wall
var inst_list = ds_list_create();
instance_place_list(x + map[? "hsp"], y, oWall, inst_list, false);
for (var i = 0; i < ds_list_size(inst_list); i++) {
	var inst = inst_list[| i];
	if (inst != noone && inst.object_index != oSeperator) {
		if (map[? "hsp"] > 0) //Going Right
			x = floor(inst.bbox_left + (x - bbox_right) - 1);
		else if (map[? "hsp"] < 0) //Going Left
			x = ceil(inst.bbox_right + (x - bbox_left) + 1);
		map[? "hsp"] = 0;
		break;
	}
}

ds_list_clear(inst_list);

//Slide on floor
instance_place_list(x, y + map[? "vsp"], oWall, inst_list, false);
map[? "touching_floor"] = false;
for (var i = 0; i < ds_list_size(inst_list); i++) {
	var inst = inst_list[| i];
	if (inst != noone && inst.object_index != oSeperator) {
		if (map[? "vsp"] > 0) //Falling
			y = floor(inst.bbox_top + (y - bbox_bottom) - 1);
		else if (map[? "vsp"] < 0) //Going up
			y = ceil(inst.bbox_bottom + (y - bbox_top) + 1);
		map[? "vsp"] = 0;
		map[? "touching_floor"] = true;
		break;
	}
}
ds_list_destroy(inst_list);
	
x += map[? "hsp"] * owner.time_dialation;
y += map[? "vsp"] * owner.time_dialation;
image_angle = direction;

if (map[? "hsp"] == 0 && map[? "vsp"] == 0)
	event_user(0);
