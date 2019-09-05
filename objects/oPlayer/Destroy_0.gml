/// @description Clean up data structures
// You can write your code in this editor
ds_list_destroy(buffs);
ds_map_destroy(rocket_map);
ds_map_destroy(playerMap);
ds_map_destroy(ult_casting_map);
ds_map_destroy(characterSprites);

//Destroy ai brain
if (aiBrain != noone && player_aimode)
	instance_destroy(aiBrain);