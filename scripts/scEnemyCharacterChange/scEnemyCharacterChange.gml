///@desc Change an entities character
///@arg character

var char = argument[0];

ds_map_destroy(player_map[? PLAYER_MAP.CHARACTER_INFO]);
var map = scEnemyCharacterGetInfo(char);

//Load Sprites
characterSprites = scEnemyCharacterGetSprites(map[? CHARACTER_MAP.TYPE]);

if (map[? CHARACTER_MAP.PALETTE_INDEX] >= sprite_get_width(map[? CHARACTER_MAP.PALETTE])) //Shader safety
	map[? CHARACTER_MAP.PALETTE_INDEX] = 0;

//Do some stuff
shootable_map[? SHOOTABLE_MAP.HEALTH] = map[? CHARACTER_MAP.HEALTH];
shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] = map[? CHARACTER_MAP.HEALTH];
player_map[? PLAYER_MAP.CHARACTER_INFO] = map;

//Load character weapon
scWeaponStart();

enum CHARACTER_ENEMY {
	ENEMY,
	//KEEP LAST
	LENGTH
}