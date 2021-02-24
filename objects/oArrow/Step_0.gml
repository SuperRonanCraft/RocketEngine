/// @description  Move Arrow/Find Collisions


//Run special step script and override movement

var arrow_map = weapon_map[? WEAPON_MAP.MAP];
var time = arrow_map[? ARROW_MAP.TIMER];
var checkroom = arrow_map[? ARROW_MAP.SHURIKEN_AUTO_DESTROY_ROOM];


//If there is a special script to run, nullify all else and run it instead
if (arrow_map[? ARROW_MAP.SHURIKEN_STEP] != noone)
	script_execute(arrow_map[? ARROW_MAP.SHURIKEN_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---

var targetAngle = 270;
if(grv_dir == -1){
	targetAngle = 90;
}



if(!deactivate){
	vsp += (arrow_map[? ARROW_MAP.WEIGHT] * grv_dir)/room_speed;
}

var bonusSPD = abs(hsp)+abs(vsp);
if(bonusSPD >= arrow_map[?ARROW_MAP.SPEED] *  ((arrow_map[? ARROW_MAP.POWER_MAX])/100)){
	fullPower = true;	
}
var bonusDMG = dmg;
var bonusKB = sign(hsp) * bonusSPD/4 + kb;


if(!deactivate){
	
	scProjectileMove(arrow_map, touching);

	direction = darctan2(vsp * -grv_dir,hsp);
	image_angle = direction;

	for (var i = 0; i < ds_list_size(touching); i++) {
    
	
		var obj = touching[|i];
		
		//Prioritize player collision
		
		var isPlayer = scGetParent(pEntity, obj);
		//show_debug_message("isplayer " + string(isPlayer));
		
		if(isPlayer && !deactivate){
			var _team = owner.team; //Owner Team
			var _oteam = obj.team; //Entity Team
		
			if((_team != _oteam || _team == TEAM.NONE) && obj.id != owner.id){
				if (ds_list_find_index(confirmList, obj) == -1) { //We've never hit this player before
					ds_list_add(confirmList, obj);
					ds_list_add(hitList, obj);
		
					if (!obj.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow weapon to interact
				
					
					//Knockback
					obj.gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] += (hsp / 2 + bonusKB);
					obj.gravity_map[? GRAVITY_MAP.VSP_MOVE] += (vsp);
		
					//Damage player
					if (scShootableDamage(owner, obj, false, true, dmg,noone,DAMAGE_TYPE.STAB,noone,noone)){
						obj.causeOfDeath = arrow_map[? ARROW_MAP.DEATHCAUSE];
						
					}
		
					if (arrow_map[? ARROW_MAP.ULTIMATE_CHARGE_GIVE])
						scUltimateAddCharge(owner, DAMAGE_TYPE.DIRECT, arrow_map[? ARROW_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
					scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
					scScreenShake(25,5);
					
					//Stick script
					
					if(flyWith == noone){
						if(instance_place(newX,newY,obj.object_index) == obj.id){
							x = newX;
							y = newY;
							hsp = 0;
							vsp = 0;
							stuckTo = obj.id;
							newX = x - obj.x + irandom_range(-2,2);
							newY = y - obj.y + irandom_range(-2,2);
							deactivate = true;
							newAngle = image_angle;
						}
						
						else{
							event_user(0);	
						}
					
					}

				}
			}
		}
		
		
		//Wall Collision
		if(scGetParent(oWall, obj)){
			if(obj.shootable || obj.is_wall ){
				deactivate = true;
				event_user(1);
				//Break on hit
				if(!fullPower){
					event_user(0);
				}
				
				//Stick to surface
				else{	
					//Stick script
					if(instance_place(newX,newY,obj.object_index) == obj.id){
						x = newX;
						y = newY;
						hsp = 0;
						vsp = 0;
						stuckTo = obj.id;
						newX = x - obj.x + irandom_range(-2,2);
						newY = y - obj.y + irandom_range(-2,2);
						newAngle = image_angle;
					}
					else{
						event_user(0);	
					}
				}
			}
		}
	
	}

}


//TODO: Fix 'ragdoll' physics

if(flyWith != noone && !deactivate){
	if(false && instance_exists(flyWith)){
		flyWith.gravity_map[?GRAVITY_MAP.HSP_MOVE] = hsp;
		flyWith.gravity_map[?GRAVITY_MAP.VSP_MOVE] = vsp;
	}
			
}


if(stuckTo != noone && deactivate){
	if(instance_exists(stuckTo)){
		if(hsp == 0 && vsp == 0){
			x = stuckTo.x + newX;
			y = stuckTo.y + newY;
			image_angle = newAngle;
			/*
			if(scGetParent(oPlayer,stuckTo)){
				scSpawnParticle(x, y, 1, 2,  spBlood, WORLDPART_TYPE.BLOOD);	
			}
			*/
		}
	}
	else{
		event_user(0);	
	}
}

else if(deactivate){
	event_user(0);	
}

var _advance = global.play && !global.gameover;

if (_advance) {
	x += hsp;
	y += vsp;
}

if(deactivate){
	timer--
}
if(timer <= 0){
	event_user(0);	
}

//Despawn if out of room.
if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20))
		instance_destroy();