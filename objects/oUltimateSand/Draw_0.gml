/// @desc draw the cloud

if (fading) {
	//If fading out
	var val = fading_type ? (-alpha_index) : alpha_index;
	fading_alpha = clamp(fading_alpha + val, 0, alpha_max);
	//Delete if fading out and alpha is less then 0
	if (fading_type && fading_alpha <= 0)
		instance_destroy();
	else if (fading_alpha == alpha_max)
		fading = false;
}

xpos1 = x - cloud_width / 2;
xpos2 = x + cloud_width / 2;

//Draw the box
draw_set_alpha(fading_alpha);
var c = c_orange;
draw_rectangle_color(xpos1, 0, xpos2, RES_H, c, c, c, c, false);
draw_set_alpha(1);

//Particles
part_emitter_region(global.ParticleSystem1, global.Emitter1, xpos1, xpos2, 0, RES_H, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ParticleSystem1, global.Emitter1, cloud_particle, cloud_particle_amt);
