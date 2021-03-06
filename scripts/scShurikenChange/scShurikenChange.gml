///@arg type
///@arg weapon-map

var shur = argument0;
var map = argument1;
//var old_shuriken_map = map[? WEAPON_MAP.MAP];

//Makes sure shuriken is not the same as the one already equipped
//if (old_shuriken_map[? SHURIKEN_MAP.TYPE] != shur) {
	//Clear the map
	//ds_map_destroy(rocket_map);
	//All default values
	//scRocketDefaults(rocket_map);
	//Grab custom weapon keys
	//scRocketGet(weapons[weapon], rocket_map);
	var shuriken_map = scShurikenGet(shur);
	map[? WEAPON_MAP.MAP] = shuriken_map;
	map[? WEAPON_MAP.NAME] = shuriken_map[? SHURIKEN_MAP.NAME];
	map[? WEAPON_MAP.DESCRIPTION] = shuriken_map[? SHURIKEN_MAP.DESCRIPTION];
	map[? WEAPON_MAP.AMMO] = shuriken_map[? SHURIKEN_MAP.CLIP];
	map[? WEAPON_MAP.GUI_ICON] = shuriken_map[? SHURIKEN_MAP.PROJECTILE];
	//map[? WEAPON_MAP.GUI_BUFFS] = shuriken_map[? SHURIKEN_MAP.BUFF];
	map[? WEAPON_MAP.CLIP] = map[? WEAPON_MAP.AMMO];
	map[? WEAPON_MAP.DAMAGE] = shuriken_map[? SHURIKEN_MAP.DAMAGE];
	map[? WEAPON_MAP.SPEED] = shuriken_map[? SHURIKEN_MAP.SPEED];
	map[? WEAPON_MAP.COOLDOWN_TIME] = 15;
	map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL] = shuriken_map[? SHURIKEN_MAP.COOLDOWN];
	map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] = shuriken_map[? SHURIKEN_MAP.RELOAD_TIME];
	map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 2;
	//if (system_ultimate)
	//	ultimate_map[? ULTIMATE_CASTING_MAP.CASTING] = false; //Reset the ult timer
	map[? WEAPON_MAP.RELOAD_TIME] = 0;
	//map[? WEAPON_MAP.ULTIMATE] = shuriken_map[? SHURIKEN_MAP.ULTIMATE];
//}