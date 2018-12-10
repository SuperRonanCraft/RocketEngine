if (rocket_map[? ROCKET_MAP.ROCKET_DRAW] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DRAW]);
else if (sprite_index != noone)
	draw_self();
	
if (rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] != noone) {
	//Particle emitter first gets placed around the back of the rocket
	var facing = 1;
	if (direction > 90 && direction < 270)
		facing = -1;
	var offset = rocket_map[? ROCKET_MAP.OFFSET];
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - (facing*((x - bbox_left)-5)) - (offset * facing), x - (facing*5),y-5,y+5,ps_shape_ellipse,ps_distr_gaussian)
	//Then bursts with the defined particle over at oParticleHandler
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, rocket_map[? ROCKET_MAP.PARTICLE_TRAIL], rocket_map[? ROCKET_MAP.PARTICLE_AMT]);
}

//Grow into the stage
if (image_xscale < original_xscale)
	image_xscale = min(image_xscale + scale_speed, original_xscale);
if (image_yscale < original_yscale)
	image_yscale = min(image_yscale + scale_speed, original_yscale);