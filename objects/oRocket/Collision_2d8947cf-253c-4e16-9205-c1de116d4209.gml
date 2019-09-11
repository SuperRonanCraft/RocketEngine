/// @desc hit a wall

var rocket_map = weapon_map[? WEAPON_MAP.MAP];
//Check if the rocket ignores walls and if the wall is shootable
if (!destroy && !rocket_map[? ROCKET_MAP.IGNORE_WALL] && other.shootable || other.is_wall) {
	scPlaySound(SOUND.EFFECT_EXP);
	//Custom Explosion with an oWall script?
	if (rocket_map[? ROCKET_MAP.EXPLOSION_WALL] != noone)
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_WALL], other);
	else
		event_user(0);
}
