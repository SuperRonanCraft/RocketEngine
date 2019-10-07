/// @desc Hit a shootable

//If the rocket is not from the same shooter
//Add the pShootable to the hitlist
//Do damage once to the hitlist
var isPlayer = other.object_index == oPlayer;

var _team = owner.shootable_map[? SHOOTABLE_MAP.TEAM]; //Owner Team
var _oteam = other.shootable_map[? SHOOTABLE_MAP.TEAM]; //Entity Team

if (!destroy && _team != _oteam) //Not destroy and is not same team
	if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
		ds_list_add(confirmList, other);
		ds_list_add(hitList, other);
		
		if (!other.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow rocket to interact
		var rocket_map = weapon_map[? WEAPON_MAP.MAP];
		if (isPlayer) {
			//Add buff
			if (rocket_map[? ROCKET_MAP.BUFF] != noone)
				scBuffAdd(rocket_map[? ROCKET_MAP.BUFF], other, owner);
			//Knockback
			scShootableKnockback(other, rocket_map[? ROCKET_MAP.KBAMT] * other.knockback_multiplier, direction);
		}
		
		//Damage player
		var dmg = weapon_map[? WEAPON_MAP.DAMAGE];
		//if (dmg != -1 && rocket_map[? ROCKET_MAP.DAMAGE_ROCKET] != 0)
		//	dmg = rocket_map[? ROCKET_MAP.DAMAGE_ROCKET];
		
		if (scShootableDamage(owner, other, false, true, dmg) && isPlayer)
			other.causeOfDeath = rocket_map[? ROCKET_MAP.DEATHCAUSE];
		
		if (rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE])
			scUltimateAddCharge(owner, DAMAGETYPE.DIRECT, rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
		scPlaySound(SOUND.EFFECT_EXP);
		//Custom Explosion with a pShootable script
		if (rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] != noone)
			script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE], other);
		else
			//Run the default explosion event/script
			event_user(0);
	}