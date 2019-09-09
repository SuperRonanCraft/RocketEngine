/// @arg Weapon
var roc = argument0;
var map = weapon_map;
var old_rocket_map = map[? WEAPON_MAP.MAP];
//Makes sure rocket is not the same as the one already equipped (everts auto reload)
if (old_rocket_map[? ROCKET_MAP.TYPE] != roc) {
	//Clear the map
	//ds_map_destroy(rocket_map);
	//All default values
	//scRocketDefaults(rocket_map);
	//Grab custom weapon keys
	//scRocketGet(weapons[weapon], rocket_map);
	var rocket_map = scRocketGet(roc);
	map[? WEAPON_MAP.MAP] = rocket_map;
	map[? WEAPON_MAP.AMMO] = rocket_map[? ROCKET_MAP.CLIP];
	map[? WEAPON_MAP.CLIP] = map[? WEAPON_MAP.AMMO];
	map[? WEAPON_MAP.GUI_ICON] = rocket_map[? ROCKET_MAP.PROJECTILE];
	map[? WEAPON_MAP.GUI_BUFFS] = rocket_map[? ROCKET_MAP.BUFF];
	map[? WEAPON_MAP.COOLDOWN_TIME] = 15;
	///
	//NEW
	map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL] = rocket_map[? ROCKET_MAP.COOLDOWN];
	map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] = rocket_map[? ROCKET_MAP.RELOAD_TIME];
	//NEW
	//
	map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 2;
	ultimate_map[? ULTIMATE_CASTING_MAP.CASTING] = false; //Reset the ult timer
	map[? WEAPON_MAP.RELOAD_TIME] = 0;
	map[? WEAPON_MAP.ULTIMATE] = rocket_map[? ROCKET_MAP.ULTIMATE];
}