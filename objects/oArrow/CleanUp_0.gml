/// @description  Clean up maps

//event_inherited();

var _map = weapon_map[? WEAPON_MAP.MAP];
ds_map_destroy(_map);
ds_map_destroy(weapon_map);
ds_list_destroy(hitList);
ds_list_destroy(confirmList);
ds_list_destroy(touching);
