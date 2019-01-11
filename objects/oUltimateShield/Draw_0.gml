/// @desc draw circle

if (fading) {
	//If fading out
	var val = fading_type ? (-alpha_index) : alpha_index;
	image_alpha = clamp(image_alpha + val, 0, alpha_max);
	//width = width_max * (image_alpha / alpha_max); 
	//Delete if fading out and alpha is less then 0
	if (fading_type && image_alpha <= 0)
		instance_destroy();
	else if (image_alpha == alpha_max)
		fading = false;
} else {
	timer--;
	if (timer <= 0) {
		fading = true;
		//True is fading out
		fading_type = true;
	}
}

//Draw the shield
draw_self();
//scDrawPiePart(x, y, 1, 1, color, radius, fading_alpha, width);
