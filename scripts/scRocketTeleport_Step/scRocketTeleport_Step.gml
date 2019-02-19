var map = teleportMap;
if (!map[? "teleporting"]) {
	var spd = rocket_map[? ROCKET_MAP.SPEED];
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
} else {
	var scale = rocket_map[? ROCKET_MAP.SCALE] / 4;
	if (!map[? "teleported"])
		if (image_xscale <= scale && image_yscale <= scale) {
			y = map[? "target_y"];
			x += lengthdir_x(rocket_map[? ROCKET_MAP.OFFSET] + 5, direction);
			map[? "teleported"] = true;
			scale = rocket_map[? ROCKET_MAP.SCALE];
			original_xscale = scale;
			original_yscale = scale;
		} else {
			original_xscale = scale;
			original_yscale = scale;
		}
	if (map[? "teleported"] && image_xscale >= scale && image_yscale >= scale)
		map[? "teleporting"] = false;
}

if (!map[? "teleported"]) {
	map[? "portal_size"] = (x - xstart) / map[? "target_dis"];
	if (map[? "portal_size"] >= 1)
		map[? "teleporting"] = true;
	else if (destroy)
		map[? "teleported"] = true;
} else {
	map[? "portal_size"] -= 0.02;
	if (map[? "portal_size"] <= 0 && destroy)
		instance_destroy();
}