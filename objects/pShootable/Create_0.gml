/// @desc Shootable object spawned

//rockets_hit = true; //Should rockets not be able to hit?
//shooter = noone; //The last person who shot them

time_dialation = 1; //Time 1 = 100% speed
//canHeal = true;

shootable_map = ds_map_create();
var map = shootable_map;
map[? SHOOTABLE_MAP.CAN_HEAL] = true; //Can heal
map[? SHOOTABLE_MAP.CAN_DAMAGE] = true; //Damage the player
map[? SHOOTABLE_MAP.CAN_INTERACT] = true; //Interact with the player
map[? SHOOTABLE_MAP.SHOOTER] = noone;
map[? SHOOTABLE_MAP.HEALTH] = 20;

enum SHOOTABLE_MAP {
	CAN_HEAL, CAN_DAMAGE, CAN_INTERACT, SHOOTER, HEALTH
}