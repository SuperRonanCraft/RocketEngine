var map = pierceMap;
if (destroy && !map[? "destroyable"]) {
	if (map[? "shield"])
		map[? "shield"] = false;
	var ex = instance_place(x, y, oExplosion);
	if (ex == noone || ex.parent == owner) {
		destroy = false;
		var rocket_map = weapon_map[? WEAPON_MAP.MAP];
		rocket_map[? ROCKET_MAP.ROCKET_AUTO_DESTROY] = true;
		map[? "destroyable"] = true;
	}
}

if (map[? "shield"]) {
	scDrawSpriteExt(x, y, map[? "spr"], floor(map[? "img"]), noone, image_alpha, image_yscale - 0.2, image_xscale - 0.2, direction);
	map[? "img"] += map[? "img_spd"];
	if (floor(map[? "img"]) >= map[? "img_max"])
		map[? "img"] = 0;
}