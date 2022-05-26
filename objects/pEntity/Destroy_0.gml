/// @description Clean up data structures
// You can write your code in this editor

if (player_map[? PLAYER_MAP.DESTROY_SCRIPT] != noone)
	script_execute(player_map[? PLAYER_MAP.DESTROY_SCRIPT]);

ds_list_destroy(buffs_map);
ds_list_destroy(health_map[?HEALTH_MAP.DAMAGE_MAP]);
ds_map_destroy(health_map);
ds_map_destroy(weapon_map);
ds_map_destroy(player_map);
if (system_ultimate)
	ds_map_destroy(ultimate_map[? ULTIMATE_CASTING_MAP.CASTING_MAP]);
ds_map_destroy(characterSprites);

//Destroy ai brain
if (aiBrain != noone && player_aimode)
	instance_destroy(aiBrain);