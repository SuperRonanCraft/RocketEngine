function scRocketSand_Step() {
	if (sand[? "target_current"] != sand[? "target"]) {
		var dir = sand[? "target_current"];
		var newdir = clamp(dir + sand[? "turnspeed"], sand[? "target"], -sand[? "target"]);
		if (newdir != dir) {
			direction += sand[? "turnspeed"];
			image_angle = direction;
			sand[? "target_current"] = newdir;
		}
	}

	var spd = weapon_map[? WEAPON_MAP.SPEED];
	scMovementLine(spd, direction);
	//x += lengthdir_x(spd, direction);
	//y += lengthdir_y(spd, direction);


}
