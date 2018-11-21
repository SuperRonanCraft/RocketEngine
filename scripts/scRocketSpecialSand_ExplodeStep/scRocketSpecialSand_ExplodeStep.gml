/// @desc explosion step
if  (!destroy && (sand[? "timer"] > sand[? "clock"])) {
	sand[? "clock"]++;
	var size = sand[? "size"];
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - (size*30), x + (size*30), y - (size*30), y + (size*30), ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.SAND], 15 * size);
} else {
	destroy = true;
	ds_map_destroy(sand);
}