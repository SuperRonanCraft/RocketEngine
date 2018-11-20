/// @desc Hit a shootable

//If the rocket is not from the same shooter
if (owner != other.id) {
	//Apply the rockets buffs by default
	if (rocket_map[? ROCKET_MAP.BUFF] != noone)
		scAddBuff(rocket_map[? ROCKET_MAP.BUFF], other);
	//Custom Explosion with a shootable script?
	if (rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] != noone)
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE], other);
	else
		//Run the default explosion event/script
		event_user(0);
}