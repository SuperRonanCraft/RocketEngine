/// @desc Hit a shootable

//If the shuriken is not from the same shooter
//Add the pShootable to the hitlist
//Do damage once to the hitlist
var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

var isPlayer = other.object_index == oPlayer;

if(shuriken_map[? SHURIKEN_MAP.PLAYER_SCRIPT] == noone){
	if (!deactivate && (isPlayer ? owner.team != other.team : true)) //Not destroy and is a player and not same team
		if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			ds_list_add(hitList, other);
		
			if (!other.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow shuriken to interact

			if (isPlayer) {
				//Add buff
				if (shuriken_map[? SHURIKEN_MAP.BUFF] != noone)
					scBuffAdd(shuriken_map[? SHURIKEN_MAP.BUFF], other, owner);
						
				//Stick to player
				if(shuriken_map[? SHURIKEN_MAP.STICK]){
					deactivate = true;
					stuckTo = other.id;
					newX = irandom_range(-5,5);
					newY = irandom_range(-5,5);
					image_speed = 0;
					depth = other.depth - 10;
				}

				//Knockback
				var facing = 1;
				if (direction > 90 && direction < 270)
					facing = -1;	
			
				other.hsp_move += facing * (weapon_map[? WEAPON_MAP.SPEED] / 2 + shuriken_map[? SHURIKEN_MAP.KBAMT]);
			} else
				event_user(1); //missed
		
			//Damage player
			var dmg = weapon_map[? WEAPON_MAP.DAMAGE];
		
			if (scDamageShootable(owner, other, false, true, dmg) && isPlayer)
				other.causeOfDeath = shuriken_map[? SHURIKEN_MAP.DEATHCAUSE];
		
			if (shuriken_map[? SHURIKEN_MAP.ULTIMATE_CHARGE_GIVE])
				scUltimateAddCharge(owner, DAMAGETYPE.DIRECT, shuriken_map[? SHURIKEN_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
			scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
		
		}
}

else if(!deactivate && (isPlayer ? owner.team != other.team : true)){
	script_execute(shuriken_map[?SHURIKEN_MAP.PLAYER_SCRIPT]);
}