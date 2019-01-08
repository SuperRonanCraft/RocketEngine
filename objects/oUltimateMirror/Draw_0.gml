/// @desc draw the mirror

//draw rectangle
var c = mirror_color;
draw_set_alpha(mirror_alpha);
scDrawRect(xpos1, y, xpos2, y - mirror_height, c, false, mirror_alpha);
draw_set_alpha(1);

//Particles
part_emitter_region(global.ParticleSystem1, global.Emitter1, xpos1, xpos2, y, y - mirror_height, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ParticleSystem1, global.Emitter1, mirror_particle, mirror_particle_amt);
