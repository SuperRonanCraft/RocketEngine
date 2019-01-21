
if (!first_draw) {
	if (rocket_map[? ROCKET_MAP.EXPLOSION_CREATE_DRAW] != noone) //Create draw event for rocket
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_CREATE_DRAW]);

	first_draw = true;
}

draw_self();