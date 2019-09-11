/// @desc a sand rockets explosion create event
/// @arg explosion-instance

//var side = direction == 0 ? 1 : -1;

bounceMap = ds_map_create();
var map = bounceMap;
map[? "bounced"] = false;
map[? "hsp"] = weapon_map[? WEAPON_MAP.SPEED];
map[? "vsp"] = -10;
map[? "grv"] = 0.4;
map[? "frc"] = 0.005;