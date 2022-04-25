/// @description  Clean up maps

//event_inherited();

if(instance_exists(Wall1))
	instance_destroy(Wall1);

var _map = weapon_map[? WEAPON_MAP.MAP];
ds_map_destroy(_map);
ds_map_destroy(weapon_map);
ds_list_destroy(hitList);
ds_list_destroy(confirmList);
ds_list_destroy(touching);
