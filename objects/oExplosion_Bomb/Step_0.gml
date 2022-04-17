/// @desc hurt the players in the hitlist
/// run custom step event and destroy
var bomb_map = weapon_map[? WEAPON_MAP.MAP];
if (doing_damage)
	for (var i = 0; i < ds_list_size(hitList); i++)
		if (ds_list_find_index(confirmList, hitList[| i]) == -1) {
			ds_list_add(confirmList, hitList[| i]);
			if (!instance_exists(hitList[| i])) {ds_list_delete(hitList, i); break;} //Not exist?
			var p = hitList[| i]; //Shootable instance
			
			if (!p.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do not interact with this shootable
			var isPlayer = scGetParent(pEntity,p);
			var dmg_todo = max(weapon_map[? WEAPON_MAP.DAMAGE], dmg);
			//if (dmg != -1 && bomb_map[? BOMB_MAP.DAMAGE_EXPLOSION] != 0)
			///	dmg = bomb_map[? BOMB_MAP.DAMAGE_EXPLOSION];
			if (isPlayer) {
				p.gravity_map[? GRAVITY_MAP.VSP_MOVE] -= 15;
				//Add buff
				if (bomb_map[? BOMB_MAP.BUFF] != noone)
					scBuffAdd(bomb_map[? BOMB_MAP.BUFF], hitList[| i], parent);
			}
			//Damage shootable
			if(scShootableDamage(other.parent, p, false, true, dmg_todo,noone,DAMAGE_TYPE.SPLASH,noone) && isPlayer)
				p.causeOfDeath = deathCause;
	
			if (bomb_map[? BOMB_MAP.ULTIMATE_CHARGE_GIVE]) //Allow the bomb to give ult charge?
				scUltimateAddCharge(parent, DAMAGE_TYPE.SPLASH, bomb_map[? BOMB_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
		}
if (bomb_map[? BOMB_MAP.EXPLOSION_STEP] != noone)
	script_execute(bomb_map[? BOMB_MAP.EXPLOSION_STEP]);
if (destroy && image_speed == 0)
	instance_destroy();