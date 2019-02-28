if (amping_parts <= 0) {
	var offset = rocket_map[? ROCKET_MAP.OFFSET];
	var xx = x - lengthdir_x(offset, direction), yy = y - lengthdir_y(offset, direction);
	part_particles_create(global.ParticleSystem1, xx, yy, oParticleHandler.ds_part[? PARTICLES.DAMAGE], 1)
	amping_parts = amping_parts_org;
} else
	amping_parts--;