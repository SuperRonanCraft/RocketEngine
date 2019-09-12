//Change a players character
///@arg character
ds_map_destroy(player_map[? PLAYER_MAP.CHARACTER_INFO]);
var map = ds_map_create();
map[? CHARACTER_MAP.TYPE] = argument0;
map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET; //Default weapon
map[? CHARACTER_MAP.HEALTH] = 20; //Default health
map[? CHARACTER_MAP.NAME] = "Bob"; //Default name
//Load Sprites
//show_debug_message("CHANGING CHARACTER TO " + string(argument0));
characterSprites = scPlayerCharacterGetSprites(map[? CHARACTER_MAP.TYPE]);

for (var i = 0; i < instance_number(object_index); i++)
	if (instance_find(object_index, i) == self) {
		switch (i) {
			case 0:
				scSettingsCache(SETTINGS.PLAYER_1_CHARACTER, map[? CHARACTER_MAP.TYPE]);
				break;
			case 1:
				scSettingsCache(SETTINGS.PLAYER_2_CHARACTER, map[? CHARACTER_MAP.TYPE]);
				break;
			case 2:
				scSettingsCache(SETTINGS.PLAYER_3_CHARACTER, map[? CHARACTER_MAP.TYPE]);
				break;
			case 3:
				scSettingsCache(SETTINGS.PLAYER_4_CHARACTER, map[? CHARACTER_MAP.TYPE]);
				break;
			default: show_debug_message("No Player #" + string(i + 2))
		}
		break;
	}


switch (map[? CHARACTER_MAP.TYPE]) {
	case CHARACTERS.DEFAULT:
		map[? CHARACTER_MAP.NAME] = "Steve";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.ROCKET;
		map[? CHARACTER_MAP.HEALTH] = 20;
		break;
	case CHARACTERS.SWORD:
		map[? CHARACTER_MAP.NAME] = "Sword Guy";
		map[? CHARACTER_MAP.WEAPON] = WEAPON.SHURIKEN; //CHANGE TO SWORD WHEN DONE!
		map[? CHARACTER_MAP.HEALTH] = 16;
		break;
}

scWeaponStart();

//Do some stuff
shootable_map[? SHOOTABLE_MAP.HEALTH] = map[? CHARACTER_MAP.HEALTH];
shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] = map[? CHARACTER_MAP.HEALTH];
player_map[? PLAYER_MAP.CHARACTER_INFO] = map;

enum CHARACTERS {
	DEFAULT, SWORD, LENGTH
}

enum CHARACTER_MAP {
	NAME, TYPE, WEAPON, HEALTH
}