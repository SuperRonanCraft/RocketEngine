///@arg type
///@arg weapon-map
function scBulletChange(argument0, argument1) {

	var wep = argument0;
	var map = argument1;
	//var old_weapon_map = map[? WEAPON_MAP.MAP];

	//Makes sure shuriken is not the same as the one already equipped
	//if (old_weapon_map[? BULLET_MAP.TYPE] != wep) {
		//Clear the map
		//ds_map_destroy(rocket_map);
		//All default values
		//scRocketDefaults(rocket_map);
		//Grab custom weapon keys
		//scRocketGet(weapons[weapon], rocket_map);
		var bullet_map = scBulletGet(wep);
		map[? WEAPON_MAP.MAP] = bullet_map;
		map[? WEAPON_MAP.NAME] = bullet_map[? BULLET_MAP.NAME];
		map[? WEAPON_MAP.DESCRIPTION] = bullet_map[? BULLET_MAP.DESCRIPTION];
		map[? WEAPON_MAP.AMMO] = bullet_map[? BULLET_MAP.CLIP];
		map[? WEAPON_MAP.GUI_ICON] = bullet_map[? BULLET_MAP.PROJECTILE];
		//map[? WEAPON_MAP.GUI_BUFFS] = shuriken_map[? BULLET_MAP.BUFF];
		map[? WEAPON_MAP.CLIP] = map[? WEAPON_MAP.AMMO];
		map[? WEAPON_MAP.DAMAGE] = bullet_map[? BULLET_MAP.DAMAGE];
		map[? WEAPON_MAP.SPEED] = bullet_map[? BULLET_MAP.SPEED];
		map[? WEAPON_MAP.POWER] = 0;
		map[? WEAPON_MAP.COOLDOWN_TIME] = 15;
		map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL] = bullet_map[? BULLET_MAP.COOLDOWN];
		map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] = bullet_map[? BULLET_MAP.RELOAD_TIME];
		map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 2;
		//if (system_ultimate)
		//	ultimate_map[? ULTIMATE_CASTING_MAP.CASTING] = false; //Reset the ult timer
		map[? WEAPON_MAP.RELOAD_TIME] = 0;
		//map[? WEAPON_MAP.ULTIMATE] = bullet_map[? BULLET_MAP.ULTIMATE];
	//}


}
