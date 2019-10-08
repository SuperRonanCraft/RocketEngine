

//var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

if (doing_damage)
	for (var i = 0; i < ds_list_size(hitList); i++)
		if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
			ds_list_add(confirmList, hitList[| i]);
			if (!instance_exists(hitList[| i])) {ds_list_delete(hitList, i); break;} //Not exist?
			var p = hitList[| i]; //Shootable instance
			
			if (!p.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do not interact with this shootable
			var isPlayer = p.object_index == oPlayer;
			var dmg = weapon_map[? WEAPON_MAP.DAMAGE];
			//if (dmg != -1 && rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION] != 0)
			///	dmg = rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION];
			if (isPlayer) {
				//scUltimateAddCharge(owner,DAMAGETYPE.DIRECT,1);
				//Add buff or add knockback here
				p.gravity_map[? GRAVITY_MAP.VSP_MOVE] += (y - p.y) * .5;
				p.gravity_map[? GRAVITY_MAP.HSP_MOVE] += (x - p.x) * .5;
			}
		
			//Damage shootable
			if(scShootableDamage(other.parent, p, false, true, dmg) && isPlayer)
				p.causeOfDeath = deathCause;
	
		}

if (destroy && image_speed == 0){

	if(ds_list_empty(confirmList)){
		with(parent){
			
			scComboMiss();
			
		}
	}

	instance_destroy();
}
	
	