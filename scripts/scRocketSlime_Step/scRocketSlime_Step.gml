/// @desc custom rocket slime step script
function scRocketSlime_Step() {
	//Step scripts dont have arguments

	//sine wave script?
	//No, SLIME wave script
	//haha

	x += lengthdir_x(weapon_map[? WEAPON_MAP.SPEED] * owner.time_dialation, direction);
	//show_debug_message(x);
	y += (5 * -cos(1.25 * (slimeClock / 5)));
	//show_debug_message(y);

	slimeClock++;


}
