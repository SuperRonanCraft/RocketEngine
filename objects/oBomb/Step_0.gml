/// @description  Move Bomb/Find Collisions


//Run special step script and override movement

var bomb_map = weapon_map[? WEAPON_MAP.MAP];

part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);

var _advance = global.play || global.gameover;

if(!_advance)
	exit

//If there is a special script to run, nullify all else and run it instead
if (bomb_map[? BOMB_MAP.BOMB_STEP] != noone)
	script_execute(bomb_map[? BOMB_MAP.BOMB_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---



if(!deactivate){
	vsp += (bomb_map[? BOMB_MAP.WEIGHT] * grv_dir)/room_speed;
}


if(!deactivate){
	
	scProjectileMove(bomb_map, touching);
	

	for (var i = 0; i < ds_list_size(touching); i++) {
    
	
		var obj = touching[|i];
		
		//Prioritize player collision
		
		var isPlayer = scGetParent(pEntity, obj);
		//show_debug_message("isplayer " + string(isPlayer));
		
		if(!instance_exists(owner)){
			instance_destroy();
			exit;
		}
		
		if(isPlayer && !hitWall){
			var _team = owner.team; //Owner Team
			var _oteam = obj.team; //Entity Team
		
			if((_team != _oteam || _team == TEAM.NONE) && obj.id != owner.id){
				if (ds_list_find_index(confirmList, obj) == -1) { //We've never hit this player before
					ds_list_add(confirmList, obj);
					ds_list_add(hitList, obj);
		
					if (!obj.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow weapon to interact
				
				
					//Apply buff(s)
					for (var b = 0; b < array_length(bomb_map[?BOMB_MAP.BUFF]); b++) {
					    var buff_array = bomb_map[? BOMB_MAP.BUFF];
						scBuffApply(buff_array[b],obj,owner);
					}
					
					
					scPlaySound(SOUND.EFFECT_SHUR_WALL);
					scScreenShake(25,5);
					
					if(bomb_map[? BOMB_MAP.HIT_SCRIPT] != noone)
						script_execute(bomb_map[? BOMB_MAP.HIT_SCRIPT]);
					
					
					event_user(0);
					
					exit;
					
					

				}
			}
		}
		
		if(isPlayer){
			part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.EMBER], 3);
			vsp -= 0.1;
			timer+= 5;
		}
		
		//Wall Collision
		if(bomb_map[?BOMB_MAP.WALL_COLLIDE] && scGetParent(oWall, obj)){
			if(obj.shootable || obj.is_wall ){
				hitWall = true;
				if(bomb_map[? BOMB_MAP.WALL_SCRIPT] != noone)
					script_execute(bomb_map[? BOMB_MAP.WALL_SCRIPT]);
				
				var attempts = 0;
				var signCheckX = 1;
				var signCheckY = -1;
				while(attempts <= 2){
					attempts++;
					var wallToCheck = instance_place(x+(hsp*signCheckX), y+(vsp*signCheckY), oWall);
					if(wallToCheck == noone){
						hsp*= signCheckX;
						vsp*= signCheckY;
						break;
					}
					else if(attempts == 1){
						signCheckX = -1;
						signCheckY = 1;
					}
					else if(attempts == 2){
						signCheckX = -1;
						signCheckY = -1;
					}
				}
				
				hsp *= 0.25;
				vsp *= 0.5;
				
				
			}
		}
	
	}

}

if (!deactivate && bomb_map[? BOMB_MAP.PARTICLE] != noone) {
	
	if(!hitWall)
		color_overlay = c_orange;
	else
		color_overlay = c_white;
		
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? bomb_map[? BOMB_MAP.PARTICLE]], bomb_map[? BOMB_MAP.PARTICLE_AMT]);
	
	timer++;
	
	if(timer > bomb_map[?BOMB_MAP.TIMER]*0.75){
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SMOKE2], 2);
	}
	
	if(timer > bomb_map[?BOMB_MAP.TIMER]){
		event_user(0);	
	}
}






if (_advance) {
	x += hsp;
	y += vsp;
}


//Despawn if out of room.


if ((x > room_width + 20 || x < -20 || y > room_height + 20)){
		
	instance_destroy();
}