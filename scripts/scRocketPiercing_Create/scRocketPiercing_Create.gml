pierceMap = ds_map_create();

var map = pierceMap;

map[? "shield"] = true;
map[? "destroyable"] = false;
map[? "spr"] = sRocShield;
map[? "img"] = 0;
map[? "img_max"] = sprite_get_number(map[? "spr"]);
map[? "img_spd"] = sprite_get_speed(map[? "spr"]);