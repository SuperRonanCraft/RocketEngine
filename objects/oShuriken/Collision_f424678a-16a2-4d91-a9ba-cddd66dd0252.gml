/// @desc Hit a shootable

//If the shuriken is not from the same shooter
//Add the pShootable to the hitlist
//Do damage once to the hitlist
var isPlayer = other.object_index == oPlayer;
if (!deactivate && (isPlayer ? owner.team != other.team : true)) //Not destroy and is a player and not same team
	if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
		ds_list_add(confirmList, other);
		ds_list_add(hitList, other);
		
		if (!other.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow shuriken to interact

		if (isPlayer) {
			//Add buff
			if (shuriken_map[? SHURIKEN_MAP.BUFF] != noone)
				scBuffAdd(shuriken_map[? SHURIKEN_MAP.BUFF], other, owner);
			//Knockback
			scKnockbackGive(other, shuriken_map[? SHURIKEN_MAP.KBAMT] * other.knockback_multiplier, direction);
			
			//Stick to player
			deactivate = true;
			stuckTo = other.id;
			newX = irandom_range(-5,5);
			newY = irandom_range(-5,5);
			image_speed = 0;
			depth = other.depth - 10;
		
		}
		
		//Damage player
		var dmg = shuriken_map[? SHURIKEN_MAP.DAMAGE];
		
		if (scDamageShootable(owner, other, false, true, dmg) && isPlayer)
			other.causeOfDeath = shuriken_map[? SHURIKEN_MAP.DEATHCAUSE];
		
		if (shuriken_map[? SHURIKEN_MAP.ULTIMATE_CHARGE_GIVE])
			scUltimateAddCharge(owner, DAMAGETYPE.DIRECT, shuriken_map[? SHURIKEN_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
		scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
		
	}