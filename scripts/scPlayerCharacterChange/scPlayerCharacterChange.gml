//Change a players character
///@arg character
ds_map_destroy(player_map[? PLAYER_MAP.CHARACTER_INFO]);
var map = ds_map_create();
map[? CHARACTER_MAP.TYPE] = argument0;
map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; //Default weapon
map[? CHARACTER_MAP.HEALTH] = 20; //Default health
map[? CHARACTER_MAP.NAME] = "Bob"; //Default name

switch (map[? CHARACTER_MAP.TYPE]) {
	case CHARACTERS.DEFAULT:
		map[? CHARACTER_MAP.NAME] = "Steve";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET;
		map[? CHARACTER_MAP.HEALTH] = 20;
		break;
	case CHARACTERS.SWORD:
		map[? CHARACTER_MAP.NAME] = "Sword Guy";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; //CHANGE TO SWORD WHEN DONE!
		map[? CHARACTER_MAP.HEALTH] = 16;
		break;
}

//Do some stuff
player_map[? PLAYER_MAP.HEALTH] = map[? CHARACTER_MAP.HEALTH];
player_map[? PLAYER_MAP.HEALTH_ORIGINAL] = map[? CHARACTER_MAP.HEALTH];
shootable_map[? SHOOTABLE_MAP.HEALTH] = map[? CHARACTER_MAP.HEALTH];
player_map[? PLAYER_MAP.CHARACTER_INFO] = map;

enum CHARACTERS {
	DEFAULT, SWORD, LENGTH
}

enum CHARACTER_MAP {
	NAME, TYPE, WEAPON, HEALTH
}