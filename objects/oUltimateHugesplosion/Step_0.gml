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
	var offset = 30;
	var xx = x - lengthdir_x(offset, direction), yy = y - lengthdir_y(offset, direction);
	part_emitter_region(global.ParticleSystem1, global.Emitter1, xx + 1, xx - 1, yy + 1, yy - 1, ps_shape_ellipse,ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, explode_rocket_particle, explode_rocket_particle_amt);
	if (traveled >= explode_rocket_len)
		exploding = true;
} else if (!spawned) {
	var dir = -(360 / explode_rocket_amount) / 2;
	for (var i = 0; i < explode_rocket_amount; i++) {
		dir += (360 / explode_rocket_amount);
		scSpawnRocket(x, y, depth, dir, owner, rocket_map, [ROCKET_MAP.BUFF], [BUFFTYPE.REVERSECONTROLS]);
	}
	spawned = true;
}