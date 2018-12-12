/// @desc Hit a shootable

//If the rocket is not from the same shooter
if (owner != other.id) {
	//Apply the rockets buffs by default
	if (rocket_map[? ROCKET_MAP.BUFF] != noone)
		scAddBuff(rocket_map[? ROCKET_MAP.BUFF], other);
	//Add the pShootable to the hitlist
	ds_list_add(hitList, other);
	//Do damage once to the hitlist
	for (var i = 0; i < ds_list_size(hitList); i++)
		if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
			ds_list_add(confirmList, hitList[| i]);
			var dmg = rocket_map[? ROCKET_MAP.DAMAGE];
			if (dmg != -1 && rocket_map[? ROCKET_MAP.DAMAGE_ROCKET] != 0)
				dmg = rocket_map[? ROCKET_MAP.DAMAGE_ROCKET];
			//Damage player
			with (hitList[| i])
				scHitShootable(other.owner, false, true, dmg);
			//Add buff
			if (rocket_map[? ROCKET_MAP.BUFF] != noone)
				scAddBuff(rocket_map[? ROCKET_MAP.BUFF], hitList[| i]);
			if (rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE])
				scAddUltCharge(owner, DAMAGETYPE.DIRECT, rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
		}
	//Custom Explosion with a pShootable script
	if (rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] != noone)
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE], other);
	else
		//Run the default explosion event/script
		event_user(0);
}