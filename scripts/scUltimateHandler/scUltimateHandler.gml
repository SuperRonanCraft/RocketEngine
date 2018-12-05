if (!ult_enabled) exit; //Is the system even enabled?

if (ult_charge < 1) {ult_charge += 0.01; exit;} //Give charge, exit

var key_shoot = keyboard_check_pressed(keyshoot);
var shoot = false;

if (key_shoot) { //Is the shoot button down?
	if (key_old_shoot_timeout <= 0) //No timer? New timout time
		key_old_shoot_timeout = 30; //30 frames to click again
	else
		shoot = true; //In a timer and shoot button pressed, ULT ACTIVATED
} else if (key_old_shoot_timeout > 0) //No shoot button? Maybe they just pressed it a couple events ago
	key_old_shoot_timeout--;

if (!shoot) exit; //Not shooting but we still have full ult charge!

var map = ds_map_create(); //Create an ult map
scUltimateGet(rocket_map[? ROCKET_MAP.ULTIMATE], map); //Grab the ult map
script_execute(map[? ULTIMATE_MAP.SCRIPT]); //Run the ult script, no arguments as the player is the shooter
ult_charge = 0; //Reset the ult charge
ds_map_destroy(map); //Delete the ult map