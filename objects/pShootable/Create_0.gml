/// @desc Shootable object spawned

time_dialation = 1; //Time 1 = 100% speed

scHealthStart();

shootable_map = ds_map_create();
var map = shootable_map;
map[? SHOOTABLE_MAP.CAN_HEAL] = true; //Can heal
map[? SHOOTABLE_MAP.CAN_DAMAGE] = true; //Damage the player
map[? SHOOTABLE_MAP.CAN_INTERACT] = true; //Interact with the player
map[? SHOOTABLE_MAP.SHOOTER] = noone;
map[? SHOOTABLE_MAP.HEALTH] = 20;
map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] = map[? SHOOTABLE_MAP.HEALTH];
map[? SHOOTABLE_MAP.SHOW_DAMAGE] = true; //Show Damage number
map[? SHOOTABLE_MAP.TEAM] = team;

enum SHOOTABLE_MAP {
	CAN_HEAL, CAN_DAMAGE, CAN_INTERACT, SHOOTER, HEALTH, HEALTH_ORIGINAL, SHOW_DAMAGE,
	TEAM, DAMAGE_TYPE
}