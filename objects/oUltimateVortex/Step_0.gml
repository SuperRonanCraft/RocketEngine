/// @description  Move Arrow/Find Collisions


var _advance = global.play || global.gameover;

if(!_advance)
	exit;

var targetAngle = 270;
if(grv_dir == -1){
	targetAngle = 90;
}
if(owner != undefined && !instance_exists(owner)){
	instance_destroy();
	exit;
}

if(!deactivate){
	
	scProjectileMove(noone, touching);
	
	direction = darctan2(vsp * -grv_dir,hsp);
	image_angle = direction;

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
				
					
					//Knockback
					obj.gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] += (hsp / 2);
					obj.gravity_map[? GRAVITY_MAP.VSP_MOVE] += (vsp);
				
					
					//Damage player
					scShootableDamage(owner, obj, false, true, dmg,noone,DAMAGE_TYPE.POUND,noone,noone);
		
					scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
					
					//Stick script
					
					if(flyWith == noone){
						
						x = newX;
						y = newY;
						hsp = 0;
						vsp = 0;
						stuckTo = obj.id;
						newX = x - obj.x + irandom_range(-2,2);
						newY = y - obj.y + irandom_range(-2,2);
						deactivate = true;
						newAngle = image_angle;
						if(variable_instance_exists(stuckTo, "stuckAmount")){
							stuckTo.stuckAmount++;
							if(stuckTo.stuckAmount >= 3)
								scAchievements_CustomEvent(ACHIEVEMENTS.ACCUPUNCTURE, true);
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
	x += hsp*owner.time_dialation;
	y += vsp*owner.time_dialation;
}

if(deactivate){
	timer-=owner.time_dialation;
	pullingAmt = 0;
	if(floor(timer%5) == 0){
		ds_list_clear(pullList);
		pullingAmt = collision_circle_list(x,y,pullRadius,pWeapon,false,true,pullList,false);	
	}
	
	if(pullingAmt > 0){
		for (var i = 0; i < ds_list_size(pullList); i++) {
			var wep = pullList[|i];
			if(!instance_exists(wep)) exit;
		    wep.hsp += owner.time_dialation*lengthdir_x(point_distance(x,y, wep.x, wep.y), point_direction(wep.x, wep.y, x, y))/pullStrength;
			wep.vsp += owner.time_dialation*lengthdir_y(point_distance(x,y, wep.x, wep.y), point_direction(wep.x, wep.y, x, y))/pullStrength;
			
			part_particles_create(global.ParticleSystem1, wep.x, wep.y, oParticleHandler.ds_part[? PARTICLES.MAGNET], 1);
		}	
	}
}
if(timer < 0){
	event_user(0);	
}

//Despawn if out of room.

if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20)){	
	instance_destroy();
}