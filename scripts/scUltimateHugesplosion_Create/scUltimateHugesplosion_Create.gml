hugeMap = ds_map_create();
var map = hugeMap;
size = 1.3;
map[? "sprite"] = sprite_index;
map[? "spd"] = weapon_map[? WEAPON_MAP.SPEED] * 1.8;
sprite_index = sNuke_Default;
var rocket_map = weapon_map[? WEAPON_MAP.MAP];
map[? "dis"] = (RES_W / 2) - rocket_map[? ROCKET_MAP.OFFSET];
map[? "dis_crt"] = 0;
map[? "amt"] = 8;
map[? "exploded"] = false;