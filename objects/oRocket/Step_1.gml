/// @desc first step after create
if (first_step) exit;

if (rocket_map[? ROCKET_MAP.ROCKET_CREATE] != noone) //Script to run when a rocket has been created
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_CREATE]);
first_step = true;