function scRocketSpecialHoming_Draw() {
	var drawTargetting = true;
	with (target) {
		var dir = point_direction(other.x, other.y, x, y); //Direction to target
		var diff = angle_difference(dir, other.direction); //The difference between the rocket direction and target direction
		if (abs(diff) < 45) {
			scDrawLine(other.x, other.y, x, y, c_red, 3, 0.15);
			drawTargetting = false;
		}
	}

	if (drawTargetting) { //No target
		//scDrawPiePart(x, y, 1, 4, c_red, homingMap[? "len"], 0.5, 5);
		var map = homingMap;
		map[? "dir"] = clamp(map[? "dir"] + (map[? "dir_side"] * map[? "dir_change"]), -map[? "dir_max"], map[? "dir_max"]);
		var dir = map[? "dir"];

		if (abs(dir) >= map[? "dir_max"])
			map[? "dir_side"] *= -1;

		var xx = x + lengthdir_x(map[? "len"], direction + dir);
		var yy = y + lengthdir_y(map[? "len"], direction + dir);
		scDrawLine(x, y, xx, yy, c_red, 3, 0.15);
	}



}
