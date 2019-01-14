/// @desc 1v1 Gamemode has started

//Log new 1v1 game
scData_StartCount()

//Max amount of oRocketPickup
pickups_max = global.mode_extradrops ? 60 : 6;
//Pickups that should spawn
pickups = 0;
//How much have been created
pickups_created = 0;
//Delay between each pickup spawn
spawn_timer_delay = global.mode_extradrops ? 20 : 60;
spawn_timer = spawn_timer_delay;

event_inherited();

global.gamemode = GAMEMODE.ONEVONE;