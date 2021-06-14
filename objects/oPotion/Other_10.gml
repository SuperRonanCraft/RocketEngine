/// @description  Despawn

var potion_map = weapon_map[? WEAPON_MAP.MAP];

if (potion_map[? POTION_MAP.DESPAWN_SCRIPT] == noone) {
	part_type_color1(oParticleHandler.ds_part[?potion_map[?POTION_MAP.PARTICLE_SPLASH]], potion_map[?POTION_MAP.PARTICLE_SPLASH_COLOR]);
	part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.POTION_SPLASH], 20);
	instance_destroy();
	


}

else{
	script_execute(potion_map[? POTION_MAP.DESPAWN_SCRIPT]);
}

