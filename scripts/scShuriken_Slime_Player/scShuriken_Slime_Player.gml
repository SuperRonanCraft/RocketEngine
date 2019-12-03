var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

var isPlayer = other.object_index == oPlayer;

if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			ds_list_add(hitList, other);
		
			if (!other.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow shuriken to interact

			if (isPlayer) {
				//Add buff
				image_xscale = 0.5;
				image_yscale = 0.5;
				
				deactivate = true;
				stuckTo = other.id;
						
				newX = irandom_range(other.bbox_left,other.bbox_right);
				newY = irandom_range(other.bbox_top,other.bbox_bottom);
					
				newX = other.x - newX;
				newY = other.y - newY;
				depth = other.depth - 10;
				
				image_angle = irandom_range(0,359);
				sprite_index = choose(sShuriken_Slime_Hit1,sShuriken_Slime_Hit2,sShuriken_Slime_Hit3);
				loop = false;
				//Knockback
				var facing = 1;
				if (direction > 90 && direction < 270)
					facing = -1;	
			
				//other.hsp_move += facing * (weapon_map[? WEAPON_MAP.SPEED] / 2 + shuriken_map[? SHURIKEN_MAP.KBAMT]);
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