///@desc Change an entities character
///@arg character
///@arg load
///@arg send-to-server
function scPlayerCharacterChange() {

	var char = argument[0];
	var load = argument_count > 1 ? (argument[1] != noone ? argument[1] : true) : true;
	var send = argument_count > 2 ? (argument[2] != noone ? argument[2] : true) : true;

	ds_map_destroy(player_map[? PLAYER_MAP.CHARACTER_INFO]);
	var map = scPlayerCharacterGetInfo(char);

	//Load Sprites
	characterSprites = scPlayerCharacterGetSprites(map[? CHARACTER_MAP.TYPE]);

	if (load)
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


	if (map[? CHARACTER_MAP.PALETTE_INDEX] >= sprite_get_width(map[? CHARACTER_MAP.PALETTE])) //Shader safety
		map[? CHARACTER_MAP.PALETTE_INDEX] = 0;

	//Set base movespeed
	shootable_map[? SHOOTABLE_MAP.SPEED] = map[? CHARACTER_MAP.SPEED];

	//Set base health
	shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = map[? CHARACTER_MAP.HEALTH_BASE];
	shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = map[? CHARACTER_MAP.HEALTH_BASE];
	//Set shield health
	shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] = map[? CHARACTER_MAP.HEALTH_SHIELD];
	shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL] = map[? CHARACTER_MAP.HEALTH_SHIELD];
	//Set armor health
	shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] = map[? CHARACTER_MAP.HEALTH_ARMOR];
	shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR_ORIGINAL] = map[? CHARACTER_MAP.HEALTH_ARMOR];
	player_map[? PLAYER_MAP.CHARACTER_INFO] = map;

	//Load character weapon
	weapon_map = scWeaponGet(map[? CHARACTER_MAP.WEAPON]);

	//Load Character Abilities
	scAbilityStart(map[? CHARACTER_MAP.ABILITY]);

	if (send && instance_exists(oClient))
		scNetworkSendCharacter(map[? CHARACTER_MAP.TYPE]);

	enum CHARACTER {
		DEFAULT, SWORD, ARROW, POTION, BOMB,
		//KEEP LAST
		LENGTH
	}

	enum CHARACTER_MAP {
		NAME, TYPE, WEAPON, SPEED, HEALTH_BASE, HEALTH_SHIELD, HEALTH_ARMOR, PALETTE, PALETTE_INDEX,
		ULTIMATE, ABILITY,
	
		//SOUND
		SOUND_DIE,
		//Can this character be selected
		CAN_PICK
	}


}
