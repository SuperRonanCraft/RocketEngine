/// @desc draw particles

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

if (!fading)
	if (swipe_side) { //Target is the right side of the screen
		if (x > RES_W) { //Change target
			swipe_side = !swipe_side;
			swipe_current++;
		} else
			x += swipe_speed;
	} else { //Target is the left side of the screen
		if (x < 0) { //Change target
			swipe_side = !swipe_side;
			swipe_current++;
		} else
			x -= swipe_speed;
	}

//Find the x values
x1 = x - (swipe_width / 2);
x2 = x + (swipe_width / 2);

//Particles
part_emitter_region(global.ParticleSystem1, global.Emitter1, x1, x2, y1, y2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ParticleSystem1, global.Emitter1, swipe_particle, swipe_particle_amt);

//Box
draw_set_alpha(fading_alpha);
draw_rectangle_color(x1, y1, x2, y2, color, color, color, color, false);
draw_set_alpha(1);

//Fading out?
if (!fading && swipe_current >= swipe_amt) {
	fading = true;
	//True is fading out
	fading_type = true;
}