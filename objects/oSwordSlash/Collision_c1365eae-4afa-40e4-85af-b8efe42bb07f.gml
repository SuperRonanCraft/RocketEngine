/// @description  
if (other.owner != owner && timer > 0) //Is not your rocket
	with (other) {
		if (target != noone)
			target = owner;
		owner = other.owner; //Change the owner
		direction = direction + 180; //Flip the rocket
		image_angle = direction;
		
		part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_rectangle, ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SCRAPE], 5);

	}