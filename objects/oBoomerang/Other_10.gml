/// @description  Despawn

var boomerang_map = weapon_map[? WEAPON_MAP.MAP];

if (boomerang_map[? BOOMERANG_MAP.DESPAWN_SCRIPT] == noone) {
		
	part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.SCRAPE_FLARE], 120);
	instance_destroy();


}

else{
	script_execute(boomerang_map[? BOOMERANG_MAP.DESPAWN_SCRIPT]);
}

