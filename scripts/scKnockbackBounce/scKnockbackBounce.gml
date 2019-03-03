///knockBack Bounce


//if (abs(hsp_knockback / 2) < 7) {
//	hsp_move = hsp;
//	hsp_knockback = hsp;
//} else {
	part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.KBHIT], 1);
	hsp_knockback /= -1.3;
	hsp_move = hsp;
//}