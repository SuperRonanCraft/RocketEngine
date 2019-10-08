///knockBack Bounce


//if (abs(hsp_knockback / 2) < 7) {
//	hsp_move = hsp;
//	hsp_knockback = hsp;
//} else {
	part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.KBHIT], 1);
	var _map = gravity_map;
	_map[? GRAVITY_MAP.HSP_KNOCKBACK] *= -1.0;
	_map[? GRAVITY_MAP.HSP_MOVE] = _map[? GRAVITY_MAP.HSP];
//}