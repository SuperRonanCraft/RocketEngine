/// @desc 1v1 Gamemode has started

//Log new 1v1 game
scData_StartCount()

//Max amount of oRocketPickup
pickups_max = 5;
//Pickups that should spawn
pickups = 0;
//How much have been created
pickups_created = 0;
//Delay between each pickup spawn
spawn_time = 120;

event_inherited();