if (!ult_enabled) exit; //Is the system even enabled?

if (ult_charge < 1) {ult_charge += 0.01; exit;} //Give charge, exit

var key_shoot = keyboard_check(keyleft) && keyboard_check(keyright);

var shoot = false;

if (key_shoot) { //Shoot key being held down
	if (ult_casting) {
		if (ult_cast_time <= 0)
			shoot = true;
		else
			ult_cast_time--;
		current_cd = rocket_map[? ROCKET_MAP.COOLDOWN];
	} else {
		if (!keyboard_check_pressed(keyleft) && !keyboard_check_pressed(keyright)) exit; //Did we JUST press the shoot key?
		var map = ds_map_create(); //Create an ult map
		scUltimateGet(rocket_map[? ROCKET_MAP.ULTIMATE], map); //Grab the ult map
		ult_casting = true;
		ult_cast_time = map[? ULTIMATE_MAP.CAST_TIME];
		ult_cast_time_max = ult_cast_time;
		ds_map_destroy(map); //Delete the ult map
		exit;
	}
} else {
	//Reset casting
	ult_casting = false;
	if (ult_cast_time > 0)
		ult_cast_time += 1;
}

/*if (key_shoot) { //Is the shoot button down?
	if (key_old_shoot_timeout <= 0) //No timer? New timout time
		key_old_shoot_timeout = 30; //30 frames to click again
	else
		shoot = true; //In a timer and shoot button pressed, ULT ACTIVATED
} else if (key_old_shoot_timeout > 0) //No shoot button? Maybe they just pressed it a couple events ago
	key_old_shoot_timeout--;*/

if (!shoot) exit; //Not shooting but we still have full ult charge!

var map = ds_map_create(); //Create an ult map
scUltimateGet(rocket_map[? ROCKET_MAP.ULTIMATE], map); //Grab the ult map

script_execute(map[? ULTIMATE_MAP.SCRIPT]); //Run the ult script, no arguments as the player is the shooter
ult_charge = 0; //Reset the ult charge
scPlaySound(map[? ULTIMATE_MAP.SOUND_CAST]); //Play the cast sound
ds_map_destroy(map); //Delete the ult map

//No longer casting
ult_casting = false;
ult_cast_time = 0;
ult_cast_time_max = 0;