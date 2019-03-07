obsoleteMap = ds_map_create();

var map = obsoleteMap;
map[? "hsp"] = rocket_map[? ROCKET_MAP.SPEED];
map[? "vsp"] = -7;
map[? "grv"] = 0.4;
map[? "flip"] = choose(-1, 1); //-1 is right, 1 is left is right spin
map[? "flip_spd"] = 6; //Flip speed
size *= 3; //Increase explosion size