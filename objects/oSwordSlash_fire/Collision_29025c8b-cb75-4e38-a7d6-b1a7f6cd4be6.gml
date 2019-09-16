/// @description  
if (!other.deactivate && other.owner != owner && timer > 0){ //Is not your rocket
	with (other) {
		if (target != noone)
			target = owner;
			
		other.oldOwner = owner;
		//other.oldOwner_time_dialation_adjust = owner.time_dialation;
		owner = other.owner; //Change the owner
		direction = direction + 180; //Flip the rocket
		image_angle = direction;
		
		part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.FIRE2], 25);
		other.trueTimer = 4;
		
		
		
		if(weapon_map[?WEAPON_MAP.TYPE] == WEAPON.ROCKET){
			var rocket_map = weapon_map[? WEAPON_MAP.MAP];
			rocket_map[? ROCKET_MAP.EXPLOSION_SCALE] *= 2.5;
			rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] = PARTICLES.SMOKE1;
		}
		
		timer = 0;
		
	}
	
	var slash = instance_create_depth(other.x,other.y,depth,oUltimateSlashEffect);
	slash.image_blend = c_red;
	scPlaySound(SOUND.EFFECT_REFLECT);
	slash.owner = id;

}