///@desc Change a players character
///@arg character

ds_map_destroy(player_map[? PLAYER_MAP.CHARACTER_INFO]);
var map = scPlayerCharacterGetInfo(argument0);

//Load Sprites
characterSprites = scPlayerCharacterGetSprites(map[? CHARACTER_MAP.TYPE]);

for (var i = 0; i < instance_number(object_index); i++)
	if (instance_find(object_index, i) == self) {
		switch (i) {
			case 0:
				scSettingsCache(SETTINGS.PLAYER_1_CHARACTER, map[? CHARACTER_MAP.TYPE]);
				map[? CHARACTER_MAP.PALETTE_INDEX] = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_PALETTE);
				break;
			case 1:
				scSettingsCache(SETTINGS.PLAYER_2_CHARACTER, map[? CHARACTER_MAP.TYPE]);
				map[? CHARACTER_MAP.PALETTE_INDEX] = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_PALETTE);
				break;
			case 2:
				scSettingsCache(SETTINGS.PLAYER_3_CHARACTER, map[? CHARACTER_MAP.TYPE]);
				map[? CHARACTER_MAP.PALETTE_INDEX] = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_3_PALETTE);
				break;
			case 3:
				scSettingsCache(SETTINGS.PLAYER_4_CHARACTER, map[? CHARACTER_MAP.TYPE]);
				map[? CHARACTER_MAP.PALETTE_INDEX] = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_4_PALETTE);
				break;
			default: show_debug_message("No Player #" + string(i + 2))
		}
		break;
	}

scWeaponStart();

//Do some stuff
shootable_map[? SHOOTABLE_MAP.HEALTH] = map[? CHARACTER_MAP.HEALTH];
shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] = map[? CHARACTER_MAP.HEALTH];
player_map[? PLAYER_MAP.CHARACTER_INFO] = map;

//if (instance_exists(pGMM))
//	with (pGMM)
//		event_user(10); //APPLY GAMEMODE MODIFIERS

enum CHARACTERS {
	DEFAULT, SWORD, 
	//KEEP LAST
	LENGTH
}

enum CHARACTER_MAP {
	NAME, TYPE, WEAPON, HEALTH, PALETTE, PALETTE_INDEX
}