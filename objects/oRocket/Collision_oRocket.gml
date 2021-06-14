/// @desc collide with rocket

//If the rocket is not from the same shooter
/*
if (!destroy && other.owner != owner) {
	var rocket_map = weapon_map[? WEAPON_MAP.MAP];
	//Custom Explosion with another rocket script?
	if (rocket_map[? ROCKET_MAP.EXPLOSION_ROCKET] != noone) 
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_ROCKET], other);
	else {
		//No custom script, so lets make same rockets explode 3 times bigger by default
		var other_rocket_map = other.weapon_map[? WEAPON_MAP.MAP];
		if (rocket_map[? ROCKET_MAP.TYPE] == other_rocket_map[? ROCKET_MAP.TYPE])
			rocket_map[? ROCKET_MAP.EXPLOSION_SCALE] *= 2.5;
		//Run the default explosion event/script
		event_user(0);
	}
	scPlaySound(SOUND.EFFECT_EXP);
}