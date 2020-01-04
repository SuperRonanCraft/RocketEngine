/// @description  Clean up maps

//event_inherited();

ds_map_destroy(weapon_map[? WEAPON_MAP.MAP]);
ds_map_destroy(weapon_map);
ds_list_destroy(hitList);
ds_list_destroy(confirmList);
