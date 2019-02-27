if (amping_parts <= 0) {
	var offset = rocket_map[? ROCKET_MAP.OFFSET];
	var xx = x - lengthdir_x(offset, direction), yy = y - lengthdir_y(offset, direction);
	scDrawParticle(xx - 1, yy - 1, xx + 1, yy + 1, PARTICLES.DAMAGE, 1);
	amping_parts = amping_parts_org;
} else
	amping_parts--;