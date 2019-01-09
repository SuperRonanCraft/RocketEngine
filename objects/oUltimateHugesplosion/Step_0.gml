/// @desc collisions and movement

if (exploding) {
	sprite_index = explode_sprite;
	image_xscale = explode_scale;
	image_yscale = explode_scale;
	image_index = 0;
	exploding = false;
	exploded = true;
} else if (!exploded) {
	x += lengthdir_x(explode_rocket_speed, direction);
	traveled += explode_rocket_speed;
	var facing = 1;
	if (direction > 90 && direction < 270)
		facing = -1;
	var offset = 30;
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - (facing*((x - bbox_left)-5)) - (offset * facing), x - (facing*5),y-5,y+5, ps_shape_ellipse,ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, explode_rocket_particle, explode_rocket_particle_amt);
	if (traveled >= explode_rocket_len)
		exploding = true;
}
