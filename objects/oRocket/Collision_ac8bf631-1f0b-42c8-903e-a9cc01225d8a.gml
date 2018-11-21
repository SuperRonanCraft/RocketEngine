/// @desc collide with rocket

//If the rocket is not from the same shooter
if (other.owner != owner && !destroy) {
	//Custom Explosion with another rocket script?
	if (rocket_map[? ROCKET_MAP.EXPLOSION_ROCKET] != noone) 
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_ROCKET], other);
	else {
		//No custom script, so lets make same rockets explode 3 times bigger by default
		if (rocket_map[? ROCKET_MAP.TYPE] == other.rocket_map[? ROCKET_MAP.TYPE])
			size *= 3;
		//Run the default explosion event/script
		event_user(0);
	}
}