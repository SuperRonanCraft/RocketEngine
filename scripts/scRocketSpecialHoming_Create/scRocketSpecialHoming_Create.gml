target = scFindTarget(owner.team);
homingMap = ds_map_create();
var map = homingMap;

//Animation
map[? "dir_side"] = choose(1, -1);
map[? "dir_change"] = 1.5;
map[? "dir_max"] = 45;
map[? "len"] = 100;
map[? "dir"] = irandom(map[? "dir_max"]) * choose(-1, 1);