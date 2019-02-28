var map = pierceMap;
if (destroy && !map[? "destroyable"]) {
	if (map[? "shield"])
		map[? "shield"] = false;
	var ex = instance_place(x, y, oExplosion);
	if (ex == noone || ex.parent == owner) {
		destroy = false;
		rocket_map[? ROCKET_MAP.ROCKET_AUTO_DESTROY] = true;
		map[? "destroyable"] = true;
	}
}

if (map[? "shield"]) {
	scDrawSpriteExt(x, y, map[? "spr"], floor(map[? "img"]), noone, 1, noone, noone, direction);
	map[? "img"] += map[? "img_spd"];
	if (floor(map[? "img"]) >= map[? "img_max"])
		map[? "img"] = 0;
}