/// @description  Despawn

var bullet_map = weapon_map[? WEAPON_MAP.MAP];

if (bullet_map[? BULLET_MAP.DESPAWN_SCRIPT] == noone) {
		
	part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.SCRAPE_FLARE], 120);
	instance_destroy();


}

else{
	script_execute(bullet_map[? BULLET_MAP.DESPAWN_SCRIPT]);
}

