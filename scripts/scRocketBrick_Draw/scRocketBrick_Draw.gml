var rocket_map = weapon_map[? WEAPON_MAP.MAP];
if (brickMap[? "touching_floor"]) {
	var part = rocket_map[? "scrape_part"];
	var dirs = direction == 0 ? [-10, 10] : [170, 190];
	scDrawParticle(bbox_left, bbox_bottom - 1, bbox_left + 10, bbox_bottom + 1, part, 1, dirs);
}