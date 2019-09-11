
var rocket_map = weapon_map[? WEAPON_MAP.MAP];
if (!first_draw) {
	if (rocket_map[? ROCKET_MAP.EXPLOSION_CREATE_DRAW] != noone) //Create draw event for rocket
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_CREATE_DRAW]);

	first_draw = true;
}

draw_self();

//Show explosion collision box while in debug mode
if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);