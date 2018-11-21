/// @desc hit a wall

//Check if the rocket ignores walls and if the wall is shootable
if (!rocket_map[? ROCKET_MAP.IGNORE_WALL] && other.shootable) {
	//Custom Explosion with an oWall script?
	if (rocket_map[? ROCKET_MAP.EXPLOSION_WALL] != noone)
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_WALL], other);
	else
		event_user(0);
}

//Old code that does not apply defaults
/*if (rocket_map[? ROCKET_MAP.EXPLOSION_WALL] != noone){
	script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_WALL], other);
} else if (!rocket_map[? ROCKET_MAP.IGNORE_WALL] && other.shootable)
	event_user(0);*/