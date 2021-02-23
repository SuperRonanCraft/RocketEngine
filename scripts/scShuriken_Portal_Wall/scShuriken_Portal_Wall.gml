function scShuriken_Portal_Wall() {

	if (!deactivate){
		direction -= 180;
		part_particles_create(global.ParticleSystem1,x,y,oParticleHandler.ds_part[?PARTICLES.KBHIT],1);
	}


}
