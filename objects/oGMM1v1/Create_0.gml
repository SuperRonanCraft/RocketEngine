/// @desc 1v1 Gamemode has started

//Log new 1v1 game
scData_StartCount();

//Max amount of oRocketPickup
pickups_max = 6;
//Pickups that should spawn
pickups = 0;
//How much have been created
pickups_created = 0;
//Delay between each pickup spawn
spawn_timer_delay = 60;
spawn_timer = spawn_timer_delay;

switch (global.mode_1v1_pickups) {
	case 0: pickups_max = 0; break;
	case 1: break;
	case 2: pickups_max *= 10; spawn_timer_delay /= 10; break;
}

event_inherited();

var time = 0;
switch (global.mode_1v1_timer) {
	case 0: time = 30; break;
	case 1: time = 60; break;
	case 2: time = 90; break;
	case 3: time = 180; break;
	case 4: time = 300; break;
}

timer = time; //New time
timer_current = timer;

with (oPlayer) {
	switch (global.mode_1v1_health) {
		case 0: hp /= 10; break;
		case 1: hp /= 2; break;
		case 2: break;
		case 3: hp *= 2; break;
		case 4: hp *= 5; break;
		case 5: hp *= 10; break;
	}
	hp_original = hp;
	switch (global.mode_1v1_ultimates) {
		case 0: ult_enabled = false; break;
		case 1: break;
		case 2: ult_charge_multiplier *= 10;
	}
	rockets_enabled = global.mode_1v1_rockets;
	//if (global.mode_1v1_lowgravity)
	//	grv /= 2;
}