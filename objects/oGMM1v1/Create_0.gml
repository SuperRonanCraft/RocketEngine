/// @desc 1v1 Gamemode has started

//Number of games increases
scIncreaseGames();
scAddData("GAME " + string(oDataCollector.games) + ":");
show_debug_message("game started");
//Max amount of oRocketPickup
pickups_max = 4;
//Pickups that should spawn
pickups = 0;
//How much have been created
pickups_created = 0;
//Delay between each pickup spawn
spawn_time = 180;

//Load all default rockets
scRockets(0);

event_inherited();


