archMap = ds_map_create();
var map = archMap;

var target = scFindTarget(owner.team);
var side = (direction == 0 ? 1 : -1);
var dis = RES_W / 2 * side;
if (target != noone)
	dis = abs(target.x - x) * side;

map[? "dis"] = dis;
map[? "x"] = 0;
map[? "y"] = 0;
map[? "multi"] = choose(-1, 1) * (0.4 + random(2));