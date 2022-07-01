///@desc Change an entities character
///@arg character
function scEnemyCharacterChange() {

	var char = argument[0];

	ds_map_destroy(player_map[? PLAYER_MAP.CHARACTER_INFO]);
	var map = scEnemyCharacterGetInfo(char);

	//Load Sprites
	characterSprites = scEnemyCharacterGetSprites(map[? CHARACTER_MAP.TYPE]);

	if (map[? CHARACTER_MAP.PALETTE_INDEX] >= sprite_get_width(map[? CHARACTER_MAP.PALETTE])) //Shader safety
		map[? CHARACTER_MAP.PALETTE_INDEX] = 1;

	//Do some stuff
	shootable_map[? SHOOTABLE_MAP.SPEED] = map[? CHARACTER_MAP.SPEED];
	shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = map[? CHARACTER_MAP.HEALTH_BASE];
	shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = map[? CHARACTER_MAP.HEALTH_BASE];
	shootable_map[? SHOOTABLE_MAP.HEALTH_VITAL] = map[? CHARACTER_MAP.HEALTH_VITAL];
	shootable_map[? SHOOTABLE_MAP.HEALTH_VITAL_ORIGINAL] = map[? CHARACTER_MAP.HEALTH_VITAL];
	shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] = map[? CHARACTER_MAP.HEALTH_ARMOR];
	shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR_ORIGINAL] = map[? CHARACTER_MAP.HEALTH_ARMOR];
	shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] = map[? CHARACTER_MAP.HEALTH_SHIELD];
	shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL] = map[? CHARACTER_MAP.HEALTH_SHIELD];
	player_map[? PLAYER_MAP.CHARACTER_INFO] = map;
	health_map[? HEALTH_MAP.ALPHA] = 0; //Hide health when spawning

	//Load character weapon
	//scWeaponStart();

	enum CHARACTER_ENEMY {
		ENEMY, ZOMBIE,
		//KEEP LAST
		LENGTH
	}


}
