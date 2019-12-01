var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

var isPlayer = other.object_index == oPlayer;

if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			ds_list_add(hitList, other);
		
			if (!other.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow shuriken to interact

			if (isPlayer) {
				//Add buff
				
				scBuffAdd([BUFFTYPE.REVERSECONTROLS], other, owner, room_speed*.5);
						
			
				
				deactivate = true;
				newX = irandom_range(-5,5);
				newY = irandom_range(-5,5);

				//Knockback
				var facing = 1;
				if (direction > 90 && direction < 270)
					facing = -1;	
			
				other.hsp_move += facing * (weapon_map[? WEAPON_MAP.SPEED] / 2 + shuriken_map[? SHURIKEN_MAP.KBAMT]);
			} else
				event_user(1); //missed
		
			//Damage player
			var dmg = weapon_map[? WEAPON_MAP.DAMAGE];
		
			if (scShootableDamage(owner, other, false, true, dmg) && isPlayer)
				other.causeOfDeath = shuriken_map[? SHURIKEN_MAP.DEATHCAUSE];
		
			if (shuriken_map[? SHURIKEN_MAP.ULTIMATE_CHARGE_GIVE])
				scUltimateAddCharge(owner, DAMAGE_TYPE.DIRECT, shuriken_map[? SHURIKEN_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
			scPlaySound(SOUND.EFFECT_HIT);
		
		}