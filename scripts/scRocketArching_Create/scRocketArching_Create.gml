archMap = ds_map_create();
var map = archMap;

var target = scFindTarget(owner.team);
var side = (direction == 0 ? 1 : -1);
var dis = RES_W / 2 * side;
if (target != noone)
	dis = abs(target.x - x) * side;

//map[? "dis"] = dis;
//map[? "x"] = 0;
//map[? "y"] = 0;
map[? "clock"] = 0;
map[? "height"] = rocket_map[? "spawn_hei"];
map[? "length"] = rocket_map[? "spawn_len"];
if (rocket_map[? "spawn_extra"])
	for (var i = 1; i <= rocket_map[? "spawn_rockets"]; i++)
		scSpawnRocket(x + (5 * i), y, depth, direction, owner, rocket_map, ["spawn_extra", "spawn_hei", "spawn_len"], [false, map[? "height"] + (1.2 * i), map[? "length"] + (0.3 * i)]);
//map[? "multi"] = (owner.standing ? 1 : -1) * (0.4 + random(2));