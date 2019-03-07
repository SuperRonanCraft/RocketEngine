/// @description Clean up data structures
// You can write your code in this editor
ds_list_destroy(buffs);

//Destroy ai brain
if (aiBrain != noone && player_aimode)
	instance_destroy(aiBrain);