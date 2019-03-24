/// @desc hurt the players in the hitlist
/// run custom step event and destroy
if (doing_damage)
	for (var i = 0; i < ds_list_size(hitList); i++)
		if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
			ds_list_add(confirmList, hitList[| i]);
			if (!instance_exists(hitList[| i])) {ds_list_delete(hitList, i); break;} //Not exist?
			var p = hitList[| i]; //Shootable instance
			var dmg = rocket_map[? ROCKET_MAP.DAMAGE];
			if (dmg != -1 && rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION] != 0)
				dmg = rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION];
			if (p.object_index == oPlayer) {
				//Knockback
				scKnockbackGive(p, rocket_map[? ROCKET_MAP.KBAMT] * p.knockback_multiplier, point_direction(x, y, p.x, p.y));
				//Add buff
				if (rocket_map[? ROCKET_MAP.BUFF] != noone)
					scBuffAdd(rocket_map[? ROCKET_MAP.BUFF], hitList[| i], parent);
			}
			//Damage shootable
			if(scDamageShootable(other.parent, p, false, true, dmg))
				p.causeOfDeath = deathCause;
	
			if (rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE]) //Allow the rocket to give ult charge?
				scUltimateAddCharge(parent, DAMAGETYPE.SPLASH, rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
		}
if (rocket_map[? ROCKET_MAP.EXPLOSION_STEP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_STEP]);
if (destroy && image_speed == 0)
	instance_destroy();