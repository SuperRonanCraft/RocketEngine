/// @description  Move Bullet/Find Collisions


//Run special step script and override movement

var bullet_map = weapon_map[? WEAPON_MAP.MAP];
var time = bullet_map[? BULLET_MAP.TIMER];
var checkroom = bullet_map[? BULLET_MAP.BULLET_AUTO_DESTROY_ROOM];


//If there is a special script to run, nullify all else and run it instead
if (bullet_map[? BULLET_MAP.BULLET_STEP] != noone)
	script_execute(bullet_map[? BULLET_MAP.BULLET_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---

var _advance = global.play || global.gameover;

if(!_advance)
	exit;

var targetAngle = 270;
if(grv_dir == -1){
	targetAngle = 90;
}



if(!deactivate){
	vsp += (bullet_map[? BULLET_MAP.WEIGHT] * grv_dir)/room_speed;
}





if(!deactivate){
	
	scProjectileMove(bullet_map, touching);
	

	for (var i = 0; i < ds_list_size(touching); i++) {
    
	
		var obj = touching[|i];
		
		//Prioritize player collision
		
		var isPlayer = scGetParent(pEntity, obj);
		//show_debug_message("isplayer " + string(isPlayer));
		
		if(!instance_exists(owner)){
			instance_destroy();
			exit;
		}
		
		if(isPlayer && !deactivate){
			var _team = owner.team; //Owner Team
			var _oteam = obj.team; //Entity Team
		
			if((_team != _oteam || _team == TEAM.NONE) && obj.id != owner.id){
				if (ds_list_find_index(confirmList, obj) == -1) { //We've never hit this player before
					ds_list_add(confirmList, obj);
					ds_list_add(hitList, obj);
		
					if (!obj.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow weapon to interact
				
				
					//Apply buff(s)
					for (var b = 0; b < array_length(bullet_map[?BULLET_MAP.BUFF]); b++) {
					    var buff_array = bullet_map[? BULLET_MAP.BUFF];
						scBuffApply(buff_array[b],obj,owner);
					}
					
					
					//Damage player
					if (scShootableDamage(owner, obj, false, true, dmg,noone,bullet_map[? BULLET_MAP.DAMAGE_TYPE],noone,bullet_map[? BULLET_MAP.DAMAGE_ELEMENT])){
						obj.causeOfDeath = bullet_map[? BULLET_MAP.DEATHCAUSE];
						
					}
					
					if(!obj.gravity_map[?GRAVITY_MAP.STANDING])
						scShootableKnockback(obj, bullet_map[?BULLET_MAP.KBAMT]*0.5*(abs(hsp) + abs(vsp)), point_direction(owner.x, owner.y, obj.x, obj.y));
					else{
						obj.gravity_map[?GRAVITY_MAP.HSP_MOVE_MOD] += hsp;
						obj.gravity_map[? GRAVITY_MAP.VSP_MOVE] += vsp;
					}
					
					if (bullet_map[? BULLET_MAP.ULTIMATE_CHARGE_GIVE])
						scUltimateAddCharge(owner, DAMAGE_TYPE.DIRECT, bullet_map[? BULLET_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
					scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
					
					//Stick script
					x = obj.x;
					y = obj.y;
					
					instance_destroy();
					exit;

				}
			}
		}
		
		
		//Wall Collision
		if(timer > 5 && bullet_map[?BULLET_MAP.WALL_COLLIDE] && scGetParent(oWall, obj)){
			if(obj.shootable || obj.is_wall){
				deactivate = true;
				event_user(1);
				event_user(0);
				scSpawnParticle(newX,newY,20, 5, spDebris, WORLDPART_TYPE.DEBRIS);
				exit;
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


if (_advance) {
	x += hsp;
	y += vsp;
	
	hsp *= bullet_map[? BULLET_MAP.DAMPENING];
	vsp *= bullet_map[? BULLET_MAP.DAMPENING];
	
	direction = darctan2(-vsp, hsp);
	image_angle = direction;
}

if(abs(hsp) < 1 && abs(vsp) < 1)
	event_user(0);


timer++

if(timer >= time){
	event_user(0);	
}

//Despawn if out of room.
if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20)){
		if(bullet_map[? BULLET_MAP.OUT_OF_ROOM_SCRIPT] != -4)
			script_execute(bullet_map[? BULLET_MAP.OUT_OF_ROOM_SCRIPT])
		else
			instance_destroy();
	}