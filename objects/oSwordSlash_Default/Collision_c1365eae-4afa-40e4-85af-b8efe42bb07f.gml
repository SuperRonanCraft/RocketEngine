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
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SPARKLE], 5);
		other.trueTimer = 4;
		
	}
	
	var slash = instance_create_depth(other.x,other.y,depth,oUltimateSlashEffect);
	scPlaySound(SOUND.EFFECT_REFLECT);
	slash.owner = id;

}