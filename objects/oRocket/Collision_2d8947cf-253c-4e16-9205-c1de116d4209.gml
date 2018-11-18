/// @desc hit a wall

if (rocket_map[? ROCKET_MAP.EXPLOSION_WALL] != noone){
	script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_WALL], other);
} else if (!rocket_map[? ROCKET_MAP.IGNORE_WALL] && other.shootable)
	event_user(0);