/// @desc Hit a shootable
if (owner != other.id) {
	if (rocket_map[? ROCKET_MAP.BUFF] != noone)
		scAddBuff(rocket_map[? ROCKET_MAP.BUFF], other);
	if (rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] != noone)
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE], other);
	else 
		event_user(0);
}