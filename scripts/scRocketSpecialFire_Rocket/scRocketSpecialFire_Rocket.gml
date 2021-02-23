///@desc Ice rocket hits a rocket object.
///@arg rocket Rocket id
function scRocketSpecialFire_Rocket(argument0) {

	//initialize variables
	var hit = argument0;

	//Don't blow up if you hit the player's other rockets
	collideRocket = 1;
	//If you hit an ice rocket, explode 3x as much
	var rocket_map = weapon_map[? WEAPON_MAP.MAP];
	var hit_rocket_map = hit.weapon_map[? WEAPON_MAP.MAP];
	if (hit_rocket_map[? ROCKET_MAP.TYPE] == ROCKET.FIRE)
		scRocketSpecialFire_Explode(3 * rocket_map[? ROCKET_MAP.EXPLOSION_SCALE]);
	else if (hit_rocket_map[? ROCKET_MAP.TYPE] == ROCKET.ICE)
		scRocketSpecialFire_Explode(0.1);	
	else
		scRocketSpecialFire_Explode(1.5 * rocket_map[? ROCKET_MAP.EXPLOSION_SCALE]);


}
