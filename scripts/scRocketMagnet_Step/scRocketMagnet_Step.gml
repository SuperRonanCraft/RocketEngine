///Magnet Step
var map = magnetMap;
if (direction == 0 || direction == 180 && !map[? "movingdir"]) {
	with (map[? "target"])
		if ((other.x > x - 25 && other.x < x + 25)) {
			if (y > other.y)
				map[? "target_dir"] = 270;
			else
				map[? "target_dir"] = 90;	
			map[? "movingdir"] = true;
		}
} else if (map[? "movingdir"]) {
	var targetdir = map[? "target_dir"];
	var change = 2;
	if (targetdir == 90 && direction < 90)
		direction += change;
	else if (targetdir == 90 && direction > 90)
		direction -= change;
	else if (targetdir == 270 && direction < 180)
		direction += change;
	else if (targetdir == 270 && direction > 180)
		direction -= change;
	if (abs(direction - targetdir) <= 5) {
		direction = targetdir;
		map[? "movingdir"] = false;
	}
}
	
image_angle = direction;

var spd = rocket_map[? ROCKET_MAP.SPEED];
scMovementLine(spd, direction);