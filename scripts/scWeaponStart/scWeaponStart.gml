/// @arg weapon type

weapon_map = ds_map_create();
var map = weapon_map;
map[? WEAPON_MAP.TYPE] = argument0;
map[? WEAPON_MAP.ULTIMATE] = ULTIMATE.NONE;
map[? WEAPON_MAP.ENABLED] = true;
map[? WEAPON_MAP.RELOAD_TIME] = 0;
map[? WEAPON_MAP.COOLDOWN_TIME] = 0;
map[? WEAPON_MAP.DELAY_TIME] = -1;
map[? WEAPON_MAP.AMMO] = 0;
map[? WEAPON_MAP.MAP] = ds_map_create();
map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 1;

switch (map[? WEAPON_MAP.TYPE]) {
	case WEAPON.ROCKET:
		scRocketStart(ROCKET.SLIME);
		break;
	case WEAPON.SHRUKEN:
		//scShrukenStart();
		break;
}

enum WEAPON {
	ROCKET, SHRUKEN
}

enum WEAPON_MAP {
	TYPE, ULTIMATE, ENABLED,
	RELOAD_TIME, COOLDOWN_TIME,
	AMMO, MAP, DELAY_TIME,
	GUI_WEAPON_SCALE
}