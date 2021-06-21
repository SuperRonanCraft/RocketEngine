///@arg type
///@arg weapon-map
function scBombChange(argument0, argument1) {

	var shur = argument0;
	var map = argument1;
	//var old_bomb_map = map[? WEAPON_MAP.MAP];

	//Makes sure bomb is not the same as the one already equipped
	//if (old_bomb_map[? BOMB_MAP.TYPE] != shur) {
		//Clear the map
		//ds_map_destroy(rocket_map);
		//All default values
		//scRocketDefaults(rocket_map);
		//Grab custom weapon keys
		//scRocketGet(weapons[weapon], rocket_map);
		var bomb_map = scBombGet(shur);
		map[? WEAPON_MAP.MAP] = bomb_map;
		map[? WEAPON_MAP.NAME] = bomb_map[? BOMB_MAP.NAME];
		map[? WEAPON_MAP.DESCRIPTION] = bomb_map[? BOMB_MAP.DESCRIPTION];
		map[? WEAPON_MAP.AMMO] = bomb_map[? BOMB_MAP.CLIP];
		map[? WEAPON_MAP.GUI_ICON] = bomb_map[? BOMB_MAP.PROJECTILE];
		//map[? WEAPON_MAP.GUI_BUFFS] = bomb_map[? BOMB_MAP.BUFF];
		map[? WEAPON_MAP.CLIP] = map[? WEAPON_MAP.AMMO];
		map[? WEAPON_MAP.DAMAGE] = bomb_map[? BOMB_MAP.DAMAGE];
		map[? WEAPON_MAP.SPEED] = bomb_map[? BOMB_MAP.SPEED];
		map[? WEAPON_MAP.COOLDOWN_TIME] = 15;
		map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL] = bomb_map[? BOMB_MAP.COOLDOWN];
		map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] = bomb_map[? BOMB_MAP.RELOAD_TIME];
		map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 2;
		//if (system_ultimate)
		//	ultimate_map[? ULTIMATE_CASTING_MAP.CASTING] = false; //Reset the ult timer
		map[? WEAPON_MAP.RELOAD_TIME] = 0;
		//map[? WEAPON_MAP.ULTIMATE] = bomb_map[? BOMB_MAP.ULTIMATE];
	//}


}
