/// @arg weapon type

weapon_map = ds_map_create();
var map = weapon_map;
map[? WEAPON_MAP.TYPE] = argument0;
map[? WEAPON_MAP.ULTIMATE] = ULTIMATE.NONE;
map[? WEAPON_MAP.ENABLED] = true;
map[? WEAPON_MAP.STARTUP_TIME] = 0;
map[? WEAPON_MAP.RELOAD_TIME] = 0;
map[? WEAPON_MAP.COOLDOWN_TIME] = 0;

switch (map[? WEAPON_MAP.TYPE]) {
	case WEAPON.ROCKET:
		scRocketStart(ROCKET.DEFAULT);
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
	STARTUP_TIME, RELOAD_TIME, COOLDOWN_TIME
}