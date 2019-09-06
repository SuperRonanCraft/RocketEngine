/// @description Clean up data structures
// You can write your code in this editor
ds_list_destroy(buffs_map);
ds_map_destroy(weapon_map);
ds_map_destroy(player_map);
ds_map_destroy(ultimate_map[? ULTIMATE_CASTING_MAP.CASTING_MAP]);
ds_map_destroy(characterSprites);

//Destroy ai brain
if (aiBrain != noone && player_aimode)
	instance_destroy(aiBrain);