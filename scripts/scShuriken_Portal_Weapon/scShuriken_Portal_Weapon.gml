///@arg weapon hit

var otherWeapon = argument0;


if(!deactivate && !otherWeapon.deactivate){
	direction = irandom_range(0,359);

	part_particles_create(global.ParticleSystem1,x,y,oParticleHandler.ds_part[?PARTICLES.TECH],1);

}