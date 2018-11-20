if (rocket_map[? ROCKET_MAP.SPECIALS] != noone)
	script_execute(rocket_map[? ROCKET_MAP.SPECIALS]);
if (rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] != noone) {
	//Particle emitter first gets placed around the back of the rocket
	var facing = 1;
	if (direction > 90 && direction < 270)
		facing = -1;
	var offset = rocket_map[? ROCKET_MAP.OFFSET];
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - (facing*((x - bbox_left)-5)) - (offset * facing), x - (facing*5),y-5,y+5,ps_shape_ellipse,ps_distr_gaussian)
	//Then bursts with the defined particle over at oParticleHandler
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, rocket_map[? ROCKET_MAP.PARTICLE_TRAIL], 1);
}
if (sprite_index != noone && !destroy)
	draw_self();
