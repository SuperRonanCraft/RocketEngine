/// @desc Clean up list and remove owners rocket amount


ds_list_destroy(hitList);
ds_list_destroy(confirmList);

var rocket_map = weapon_map[? WEAPON_MAP.MAP];
if (rocket_map[? ROCKET_MAP.ROCKET_DESTROY] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DESTROY]);

ds_map_destroy(rocket_map);
ds_map_destroy(weapon_map);
event_inherited();