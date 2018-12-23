/// @desc hurt the players in the hitlist
/// run custom step event and destroy 
if (doing_damage)
	for (var i = 0; i < ds_list_size(hitList); i++)
		if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
			ds_list_add(confirmList, hitList[| i]);
			var p = hitList[| i]; //Player instance
			var dmg = rocket_map[? ROCKET_MAP.DAMAGE];
			if (dmg != -1 && rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION] != 0)
				dmg = rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION];
			//Damage player
			with (p) 
				scDamageShootable(other.parent, false, true, dmg);
			//Add buff
			if (rocket_map[? ROCKET_MAP.BUFF] != noone)
				scAddBuff(rocket_map[? ROCKET_MAP.BUFF], hitList[| i]);
			if (rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE]) //Allow the rocket to give ult charge?
				scAddUltCharge(parent, DAMAGETYPE.SPLASH, rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
			//Knockback		
			doKnockback(hitList[|i], rocket_map[? ROCKET_MAP.KBAMT], point_direction(x, y, p.x, p.y));
		}
if (rocket_map[? ROCKET_MAP.EXPLOSION_STEP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_STEP]);
if (destroy && image_speed == 0)
	instance_destroy();