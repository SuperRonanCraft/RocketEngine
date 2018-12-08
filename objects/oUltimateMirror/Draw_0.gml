/// @desc draw the mirror

//draw rectangle
var c = mirror_color;
draw_set_alpha(mirror_alpha);
draw_rectangle_color(xpos1, 0, xpos2, y, c, c, c, c, false);
draw_set_alpha(1);

//Particles
part_emitter_region(global.ParticleSystem1, global.Emitter1, xpos1, xpos2, 0, y, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ParticleSystem1, global.Emitter1, mirror_particle, mirror_particle_amt / (RES_H / y));
