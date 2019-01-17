/// @arg pickups value
/// @arg delay between pickups
/// @arg mode multiplier

//Max amount of oRocketPickup
pickups_max = argument0;
//Pickups that should spawn
pickups = 0;
//How much have been created
pickups_created = 0;
//Delay between each pickup spawn
spawn_timer_delay = argument1;
spawn_timer = spawn_timer_delay;

switch (argument2) {
	case 0: pickups_max = 0; break;
	case 1: break;
	case 2: pickups_max *= 10; spawn_timer_delay /= 10; break;
}