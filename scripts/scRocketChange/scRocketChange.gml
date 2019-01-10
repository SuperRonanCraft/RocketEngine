/// @arg Weapon
var weapon = argument0;
//Makes sure rocket is not the same as the one already equipped (everts auto reload)
if (rocket_map[? ROCKET_MAP.TYPE] != weapon) {
	//Clear the map
	//ds_map_destroy(rocket_map);
	//All default values
	//scRocketDefaults(rocket_map);
	//Grab custom weapon keys
	//scRocketGet(weapons[weapon], rocket_map);
	rocket_map = scRocketGet(weapon);
	ammo = rocket_map[? ROCKET_MAP.CLIP];
	current_cd = 15;
	prj_scale = 2;
	ult_casting = false; //Reset the ult timer
}