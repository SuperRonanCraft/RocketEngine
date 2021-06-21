///@arg weapon hit
function scShuriken_Portal_Weapon(argument0) {

	var otherWeapon = argument0;


	if(!deactivate && !otherWeapon.deactivate){

		part_particles_create(global.ParticleSystem1,x,y,oParticleHandler.ds_part[?PARTICLES.TECH],1);

	}


}
