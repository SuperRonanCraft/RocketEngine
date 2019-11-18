health_map = ds_map_create();
var map = health_map;

map[? HEALTH_MAP.DAMAGE] = 0;
map[? HEALTH_MAP.DAMAGE_MUL] = 0;
map[? HEALTH_MAP.HEAL] = 0;
map[? HEALTH_MAP.X] = 20;
map[? HEALTH_MAP.Y] = 20;
map[? HEALTH_MAP.HEIGHT] = 16;
map[? HEALTH_MAP.LENGTH] = 128;
map[? HEALTH_MAP.DAMAGE_TIME] = 0;
map[? HEALTH_MAP.ALPHA] = 1;
//map[? HEALTH_MAP.DAMAGE_PERCENT_MAX] = 0;
//FLASH HEALTH
map[? HEALTH_MAP.FLASH_ALPHA] = 0;
map[? HEALTH_MAP.FLASH_ALPHA_REDUCE] = 0.05 / TIME_SPEED;
map[? HEALTH_MAP.FLASH_COLOR] = c_red;

enum HEALTH_MAP {
	DAMAGE, DAMAGE_MUL, HEAL, X, Y, HEIGHT, LENGTH,//DAMAGE_PERCENT, DAMAGE_PERCENT_MAX,
	FLASH_ALPHA, FLASH_ALPHA_REDUCE, FLASH_COLOR,
	DAMAGE_TIME, ALPHA //Time since last damage
}