/// @desc Create
facing = 1;
//Id of the player

//Load gravity variables
scGravityStart();
//Load keybinds
global.players[array_length_1d(global.players)] = self;
playerid = array_length_1d(global.players);
scKeybindsSet(keys);
//Load rocket
scRockets(ROCKET.DEFAULT);
//Display health
event_inherited();

//Buffs/Debuffs
buffs = ds_list_create();
move_adj = 0;

//Teams thing
/*var ds_map = team;
if (ds_map_exists(ds_map, "players")) {
	var old = ds_map[? "players"];
	var new = 0;
	var i = 0;
	repeat (array_length_1d(old)) {
		new[i] = old[i];
		i++;
	}
	new[i] = self;
	ds_map_set(ds_map, "players", new);
} else 
	ds_map_add(ds_map, "players", [self]);*/
	