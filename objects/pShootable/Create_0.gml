/// @desc Shootable object spawned

time_dialation = 1; //Time 1 = 100% speed

scHealthStart();

shootable_map = ds_map_create();
var map = shootable_map;
map[? SHOOTABLE_MAP.CAN_HEAL] = true; //Can heal
map[? SHOOTABLE_MAP.CAN_DAMAGE] = true; //Damage the player
map[? SHOOTABLE_MAP.CAN_INTERACT] = true; //Interact with the player
map[? SHOOTABLE_MAP.SHOOTER] = noone;
map[? SHOOTABLE_MAP.SPEED] = 8; //BASE SPEED
map[? SHOOTABLE_MAP.HEALTH] = 20; //OVERALL HEALTH
map[? SHOOTABLE_MAP.HEALTH_BASE] = map[? SHOOTABLE_MAP.HEALTH];
map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = map[? SHOOTABLE_MAP.HEALTH_BASE];
map[? SHOOTABLE_MAP.HEALTH_ARMOR] = 0;
map[? SHOOTABLE_MAP.HEALTH_ARMOR_ORIGINAL] = map[? SHOOTABLE_MAP.HEALTH_ARMOR];
map[? SHOOTABLE_MAP.ARMOR_DAMAGEREDUCTION] = 0.5;
map[? SHOOTABLE_MAP.VITAL_DAMAGEAMPLIFICATION] = 1.5;
map[? SHOOTABLE_MAP.HEALTH_SHIELD] = 0;
map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL] = map[? SHOOTABLE_MAP.HEALTH_SHIELD];
map[? SHOOTABLE_MAP.SHOW_DAMAGE] = true; //Show Damage number
map[? SHOOTABLE_MAP.TEAM] = team;
map[? SHOOTABLE_MAP.DAMAGE_TYPE] = DAMAGE_TYPE.NONE;
map[? SHOOTABLE_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.NONE;
map[? SHOOTABLE_MAP.TIME_SINCE_DAMAGE] = 0;

enum SHOOTABLE_MAP {
	CAN_HEAL, CAN_DAMAGE, CAN_INTERACT, SHOOTER, SHOW_DAMAGE,
	TEAM, DAMAGE_TYPE, DAMAGE_ELEMENT, SPEED,
	HEALTH_BASE, HEALTH_BASE_ORIGINAL,
	HEALTH_ARMOR, HEALTH_ARMOR_ORIGINAL,
	HEALTH_SHIELD, HEALTH_SHIELD_ORIGINAL,
	HEALTH, TIME_SINCE_DAMAGE,
	ARMOR_DAMAGEREDUCTION, VITAL_DAMAGEAMPLIFICATION,
	HEALTH_VITAL, HEALTH_VITAL_ORIGINAL,
}