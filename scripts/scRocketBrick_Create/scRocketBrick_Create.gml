/// @desc a sand rockets explosion create event
/// @arg explosion-instance

var side = direction == 0 ? 1 : -1;

brickMap = ds_map_create();
var map = brickMap;
map[? "hsp"] = rocket_map[? ROCKET_MAP.SPEED];
map[? "vsp"] = -2;
map[? "grv"] = 0.6;
map[? "acc"] = 0.1;
map[? "max"] = 25;
map[? "touching_floor"] = false;
map[? "ramping"] = false;