///@arg weapon

var wep = argument0;
var map = weapon_map;
var old_weapon_map = map[? WEAPON_MAP.MAP];

//Makes sure shuriken is not the same as the one already equipped
if (old_weapon_map[? ARROW_MAP.TYPE] != wep) {
	//Clear the map
	//ds_map_destroy(rocket_map);
	//All default values
	//scRocketDefaults(rocket_map);
	//Grab custom weapon keys
	//scRocketGet(weapons[weapon], rocket_map);
	var arrow_map = scArrowGet(wep);
	map[? WEAPON_MAP.MAP] = arrow_map;
	map[? WEAPON_MAP.AMMO] = arrow_map[? ARROW_MAP.CLIP];
	map[? WEAPON_MAP.GUI_ICON] = arrow_map[? ARROW_MAP.PROJECTILE];
	//map[? WEAPON_MAP.GUI_BUFFS] = shuriken_map[? ARROW_MAP.BUFF];
	map[? WEAPON_MAP.CLIP] = map[? WEAPON_MAP.AMMO];
	map[? WEAPON_MAP.DAMAGE] = arrow_map[? ARROW_MAP.DAMAGE];
	map[? WEAPON_MAP.SPEED] = arrow_map[? ARROW_MAP.SPEED];
	map[? WEAPON_MAP.POWER] = 0;
	map[? WEAPON_MAP.COOLDOWN_TIME] = 15;
	map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL] = arrow_map[? ARROW_MAP.COOLDOWN];
	map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] = arrow_map[? ARROW_MAP.RELOAD_TIME];
	map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 2;
	if (system_ultimate)
		ultimate_map[? ULTIMATE_CASTING_MAP.CASTING] = false; //Reset the ult timer
	map[? WEAPON_MAP.RELOAD_TIME] = 0;
	map[? WEAPON_MAP.ULTIMATE] = arrow_map[? ARROW_MAP.ULTIMATE];
}