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

//Draw the box
draw_set_alpha(fading_alpha);
var c = c_orange;
draw_rectangle_color(xpos1, 0, xpos2, RES_H, c, c, c, c, false);
draw_set_alpha(1);

if (!fading) {
	timer--;
	if (timer <= 0) {
		fading = true;
		//True is fading out
		fading_type = true;
	}
}