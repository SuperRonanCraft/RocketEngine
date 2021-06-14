///@arg type
///@arg weapon-map
function scPotionChange(argument0, argument1) {

	var shur = argument0;
	var map = argument1;
	//var old_potion_map = map[? WEAPON_MAP.MAP];

	//Makes sure potion is not the same as the one already equipped
	//if (old_potion_map[? POTION_MAP.TYPE] != shur) {
		//Clear the map
		//ds_map_destroy(rocket_map);
		//All default values
		//scRocketDefaults(rocket_map);
		//Grab custom weapon keys
		//scRocketGet(weapons[weapon], rocket_map);
		var potion_map = scPotionGet(shur);
		map[? WEAPON_MAP.MAP] = potion_map;
		map[? WEAPON_MAP.NAME] = potion_map[? POTION_MAP.NAME];
		map[? WEAPON_MAP.DESCRIPTION] = potion_map[? POTION_MAP.DESCRIPTION];
		map[? WEAPON_MAP.AMMO] = potion_map[? POTION_MAP.CLIP];
		map[? WEAPON_MAP.GUI_ICON] = potion_map[? POTION_MAP.PROJECTILE];
		//map[? WEAPON_MAP.GUI_BUFFS] = potion_map[? POTION_MAP.BUFF];
		map[? WEAPON_MAP.CLIP] = map[? WEAPON_MAP.AMMO];
		map[? WEAPON_MAP.DAMAGE] = potion_map[? POTION_MAP.DAMAGE];
		map[? WEAPON_MAP.SPEED] = potion_map[? POTION_MAP.SPEED];
		map[? WEAPON_MAP.COOLDOWN_TIME] = 15;
		map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL] = potion_map[? POTION_MAP.COOLDOWN];
		map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] = potion_map[? POTION_MAP.RELOAD_TIME];
		map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 2;
		//if (system_ultimate)
		//	ultimate_map[? ULTIMATE_CASTING_MAP.CASTING] = false; //Reset the ult timer
		map[? WEAPON_MAP.RELOAD_TIME] = 0;
		//map[? WEAPON_MAP.ULTIMATE] = potion_map[? POTION_MAP.ULTIMATE];
	//}


}
