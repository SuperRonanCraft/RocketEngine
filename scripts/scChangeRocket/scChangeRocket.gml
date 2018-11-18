/// @arg Weapon
var weapon = argument0;
//Clear the map
rocket_map = 0;
//All default values
scRocketsDefaults();
var wp_map = weapons[weapon];
var key = "";
for (var i = 0; i <	ds_map_size(wp_map); i++) {
	if (i == 0)
		key = ds_map_find_first(wp_map);
	else
		key = ds_map_find_next(wp_map, key);
	rocket_map[? key] = wp_map[? key];
	show_debug_message(string(key));
}
ammo = rocket_map[? ROCKET_MAP.CLIP];