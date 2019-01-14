/// @desc Hit a shootable

//If the rocket is not from the same shooter
if (!destroy && owner.team != other.team) {
	//Add the pShootable to the hitlist
	//Do damage once to the hitlist
	if (ds_list_find_index(confirmList, other) == -1) {
		ds_list_add(confirmList, other);
		ds_list_add(hitList, other);
		var dmg = rocket_map[? ROCKET_MAP.DAMAGE];
		if (dmg != -1 && rocket_map[? ROCKET_MAP.DAMAGE_ROCKET] != 0)
			dmg = rocket_map[? ROCKET_MAP.DAMAGE_ROCKET];
		
		if (other.object_index == oPlayer) {
			//Knockback
			doKnockback(other, rocket_map[? ROCKET_MAP.KBAMT], direction);
			//Add buff
			if (rocket_map[? ROCKET_MAP.BUFF] != noone)
				scBuffAdd(rocket_map[? ROCKET_MAP.BUFF], other);
		}
		
		//Damage player
		with (other)
			scDamageShootable(other.owner, false, true, dmg);
		if (rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE])
			with (owner)
				scUltimateAddCharge(DAMAGETYPE.DIRECT, rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
	}
	//Custom Explosion with a pShootable script
	if (rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] != noone)
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE], other);
	else
		//Run the default explosion event/script
		event_user(0);
}