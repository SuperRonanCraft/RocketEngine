/// @desc first step after create
if (start_script) exit;

if (rocket_map[? ROCKET_MAP.ROCKET_CREATE] != noone) //Script to run when a rocket has been created
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_CREATE]);
start_script = true;