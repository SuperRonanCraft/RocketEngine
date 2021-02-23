function scRocketObsolete_Step() {
	var map = obsoleteMap;

	//var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
	var side = direction > 90 && direction < 270 ? -1 : 1;
	map[? "vsp"] += map[? "grv"] * owner.time_dialation;
	if (sign(map[? "hsp"]) != sign(side))
		map[? "hsp"] *= -1;

	x += map[? "hsp"] * owner.time_dialation;
	y += map[? "vsp"] * owner.time_dialation;
	image_angle += map[? "flip"] * map[? "flip_spd"];


}
