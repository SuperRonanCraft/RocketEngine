/// @desc hit another rocket
//If the rocket is not from the same shooter
collideRocket = 1;
if (other.owner != owner) {
	//if (rocket_map[? ROCKET_MAP.EXPLOSION_ROCKET] != noone)
	//	script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_ROCKET], other);
	//else
		if (rocket_map[? ROCKET_MAP.TYPE] == other.rocket_map[? ROCKET_MAP.TYPE])
			size *= 3;
		event_user(0);
}