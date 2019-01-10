/// @desc Grab the rocket map with a weapon map
/// @arg weapon-map
/// @arg rocket-map

var wp_map = argument0;
var rk_map = argument1;
var key = ds_map_find_first(wp_map);
for (var i = 0; i <	ds_map_size(wp_map); i++) {
	if (i != 0)
		key = ds_map_find_next(wp_map, key);
	rk_map[? key] = wp_map[? key];
}