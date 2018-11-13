/// @desc Create
facing = 1;
//Id of the player
global.players++;
playerid = global.players;
//Load gravity variables
scGravityStart();
//Load keybinds
scKeybindsSet(playerid);
//Load rocket
scRockets(ROCKET.DEFAULT);
//Display health
event_inherited();

//Buffs/Debuffs
buffs = ds_list_create();


if (playerid == 1)
	side = SIDE.LEFT;
else
	side = SIDE.RIGHT;