if (sand[? "target_current"] != sand[? "target"]) {
	var dir = sand[? "target_current"];
	var newdir = clamp(dir + sand[? "turnspeed"], sand[? "target"], -sand[? "target"]);
	if (newdir != dir) {
		direction += sand[? "turnspeed"];
		image_angle = direction;
		sand[? "target_current"] = newdir;
	}
}

x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);