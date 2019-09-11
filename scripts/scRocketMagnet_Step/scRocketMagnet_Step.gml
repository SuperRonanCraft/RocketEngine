///Magnet Step
var map = magnetMap;
if ((direction == 0 || direction == 180) && !map[? "movingdir"]) {
	if (!instance_exists(map[? "target"]))
		map[? "target"] = scFindTarget(owner.team);
		
	with (map[? "target"])
		if ((other.x > x - other.weapon_map[? WEAPON_MAP.SPEED] - 25 && other.x < x + other.weapon_map[? WEAPON_MAP.SPEED] + 25)) {
			if (y > other.y)
				map[? "target_dir"] = 270;
			else
				map[? "target_dir"] = 90;	
			map[? "movingdir"] = true;
		}
} else if (map[? "movingdir"]) {
	var targetdir = map[? "target_dir"];
	var change = 20;
	var diff = angle_difference(direction, targetdir); //The difference between the rocket direction and target direction
	if (abs(diff) > change)
		direction -= clamp(diff, -change, change); //Slowly rotate the rocket
	else {
		map[? "movingdir"] = false;
		direction = targetdir;
	}
	image_angle = direction;
}

var spd = weapon_map[? WEAPON_MAP.SPEED];
scMovementLine(spd, direction);