function scUltimateClone_DrawCasted() {
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - 5, x + 5, y + 5, y - 5, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SPARKLE], 50);


}
