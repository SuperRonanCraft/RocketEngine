/// @arg Weapon
var weapon = argument0;
//Makes sure rocket is not the same as the one already equipped (everts auto reload)
if (rocket_map[? ROCKET_MAP.TYPE] != weapon) {
	//Clear the map
	rocket_map = 0;
	//All default values
	scRocketsDefaults();
	//Grab custom weapon keys
	var wp_map = weapons[weapon];
	var key = ds_map_find_first(wp_map);
	for (var i = 0; i <	ds_map_size(wp_map); i++) {
		if (i != 0)
			key = ds_map_find_next(wp_map, key);
		rocket_map[? key] = wp_map[? key];
	}
	ammo = rocket_map[? ROCKET_MAP.CLIP];
	current_cd = rocket_map[? ROCKET_MAP.COOLDOWN];
	prj_scale = 2;
	ult_casting = false; //Reset the ult timer
}