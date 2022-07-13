/// @description  Move Potion/Find Collisions


//Run special step script and override movement

var potion_map = weapon_map[? WEAPON_MAP.MAP];

part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);

var _advance = global.play || global.gameover;

if(!_advance)
	exit

if (owner != undefined && !instance_exists(owner)) {
	instance_destroy();
	exit;
}

//If there is a special script to run, nullify all else and run it instead
if (potion_map[? POTION_MAP.POTION_STEP] != noone)
	script_execute(potion_map[? POTION_MAP.POTION_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---



if(!deactivate){
	vsp += (potion_map[? POTION_MAP.WEIGHT] * grv_dir)/room_speed;
}


if(!deactivate){
	
	scProjectileMove(potion_map, touching);
	
	image_angle += hsp*owner.time_dialation;

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
				
					//Apply buff(s)
					for (var b = 0; b < array_length(potion_map[?POTION_MAP.BUFF]); b++) {
					    var buff_array = potion_map[? POTION_MAP.BUFF];
						scBuffApply(buff_array[b],obj,owner);
					}
					
					
					//Damage player
					if (scShootableDamage(owner, obj, false, true, dmg,noone,DAMAGE_TYPE.POUND,noone,noone)){
						obj.causeOfDeath = potion_map[? POTION_MAP.DEATHCAUSE];
		
					}
					//part_type_color1(oParticleHandler.ds_part[?potion_map[?POTION_MAP.PARTICLE_SPLASH]], potion_map[?POTION_MAP.PARTICLE_SPLASH_COLOR]);
					//part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.POTION_SPLASH], 20);
					if (potion_map[? POTION_MAP.ULTIMATE_CHARGE_GIVE])
						scUltimateAddCharge(owner, DAMAGE_TYPE.DIRECT, potion_map[? POTION_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
					scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
					scScreenShake(25,5);
					
					if(potion_map[? POTION_MAP.HIT_SCRIPT] != noone)
						script_execute(potion_map[? POTION_MAP.HIT_SCRIPT]);
					
					if(potion_map[? POTION_MAP.DELETE_ON_HIT])
						event_user(0);
					else{
						if(vsp > 0)
							vsp *= -0.5;
					}
					
					exit;
					
					

				}
			}
		}
		
		
		//Wall Collision
		if(potion_map[?POTION_MAP.WALL_COLLIDE] && scGetParent(oWall, obj) && timer >= 10){
			if(obj.shootable || obj.is_wall ){
				
				if(potion_map[? POTION_MAP.WALL_SCRIPT] != noone)
					script_execute(potion_map[? POTION_MAP.WALL_SCRIPT]);
				
				deactivate = true;
				event_user(1);
				//Break on hit
				event_user(0);
				
				exit;
				
				
			}
		}
	
	}

}

if (!deactivate && potion_map[? POTION_MAP.PARTICLE] != noone) {
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? potion_map[? POTION_MAP.PARTICLE]], potion_map[? POTION_MAP.PARTICLE_AMT]);
	
	timer+=owner.time_dialation;
	
	if(floor(timer) == 90){
		dmg *= 1.5;
		timer+=owner.time_dialation;
	}
	else if(timer > 90){
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.ANTIHEAL], 1);	
	}
	
	if(timer > 60*10){
		event_user(0);	
	}
}






if (_advance) {
	x += hsp*owner.time_dialation;
	y += vsp*owner.time_dialation;
}


//Despawn if out of room.


if ((x > room_width + 20 || x < -20 || y > room_height + 20)){
		
	instance_destroy();
}