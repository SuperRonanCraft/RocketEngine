///@desc fire rocket hits a wall.
///@arg Wall id

//initialize variables
var hit = argument0;

//If you're hitting a wall that you shoot
var rocket_map = weapon_map[? WEAPON_MAP.MAP];
if (hit.shootable && !rocket_map[? ROCKET_MAP.IGNORE_WALL])
	scRocketSpecialFire_Explode(2);


