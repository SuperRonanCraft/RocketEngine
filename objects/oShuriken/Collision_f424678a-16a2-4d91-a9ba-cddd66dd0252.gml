/// @desc Hit a shootable

//If the shuriken is not from the same shooter
//Add the pShootable to the hitlist
//Do damage once to the hitlist
if (!instance_exists(owner) || other.id == owner.id) exit; //Self damage, dont.. do that..

var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

var isPlayer = scGetParent(pEntity, other);
var _team = owner.shootable_map[? SHOOTABLE_MAP.TEAM]; //Owner Team
var _oteam = other.shootable_map[? SHOOTABLE_MAP.TEAM]; //Entity Team

if (shuriken_map[? SHURIKEN_MAP.PLAYER_SCRIPT] == noone) {
	if (!deactivate && _team != _oteam) //Activated and is not same team
		if (ds_list_find_index(confirmList, other) == -1) { //We've never hit this player before
			ds_list_add(confirmList, other);
			ds_list_add(hitList, other);
		
			if (!other.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow shuriken to interact

			if (isPlayer) {
				//Add buff
				if (shuriken_map[? SHURIKEN_MAP.BUFF] != noone)
					scBuffAdd(shuriken_map[? SHURIKEN_MAP.BUFF], other, owner);
				//Stick to player
				if (shuriken_map[? SHURIKEN_MAP.STICK]){
					deactivate = true;
					stuckTo = other.id;
					/*
					show_debug_message(string(other.bbox_left) + ", " + string(other.bbox_right));
					show_debug_message(string(other.bbox_top) + ", " + string(other.bbox_bottom));
					show_debug_message(string(other.x) + ", " + string(other.y));
					*/
					newX = irandom_range(other.bbox_left,other.bbox_right);
					newY = irandom_range(other.bbox_top,other.bbox_bottom);
					
					newX = other.x - newX;
					newY = other.y - newY;
					image_speed = 0;
					depth = other.depth - 10;
				}
				
				//If the sprite changes on stick, change it!
				
				/*
				if(shuriken_map[? SHURIKEN_MAP.SPRITE_STICK] != noone){
					image_index = 0;
					image_speed = 1;
					sprite_index = 	shuriken_map[? SHURIKEN_MAP.SPRITE_STICK];
				}
				*/

				//Knockback
				var facing = 1;
				if (direction > 90 && direction < 270)
					facing = -1;	
			
				other.gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] += facing * (weapon_map[? WEAPON_MAP.SPEED] / 2 + shuriken_map[? SHURIKEN_MAP.KBAMT]);
			} else
				event_user(1); //missed
		
			//Damage player
			var dmg = weapon_map[? WEAPON_MAP.DAMAGE];
		
			if (scShootableDamage(owner, other, false, true, dmg,false,DAMAGE_TYPE.SLICE) && isPlayer)
				other.causeOfDeath = shuriken_map[? SHURIKEN_MAP.DEATHCAUSE];
		
			if (shuriken_map[? SHURIKEN_MAP.ULTIMATE_CHARGE_GIVE])
				scUltimateAddCharge(owner, DAMAGE_TYPE.DIRECT, shuriken_map[? SHURIKEN_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
			scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
			scScreenShake(25,5);
		}
} else if (!deactivate && (isPlayer ? _team != _oteam : true)){
	script_execute(shuriken_map[? SHURIKEN_MAP.PLAYER_SCRIPT]);
}