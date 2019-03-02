/// @description Clean up data structures
// You can write your code in this editor
ds_list_destroy(buffs);
global.PlayerTotal--;        

//Destroy ai brain
if (aiBrain != noone)
	instance_destroy(aiBrain);