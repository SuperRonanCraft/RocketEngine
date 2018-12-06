/// @desc draw circle

if (fading) {
	//If fading out
	var val = fading_type ? (-alpha_index) : alpha_index;
	fading_alpha = clamp(fading_alpha + val, 0, alpha_max);
	width = width_max * (fading_alpha / alpha_max); 
	//Delete if fading out and alpha is less then 0
	if (fading_type && fading_alpha <= 0)
		instance_destroy();
	else if (fading_alpha == alpha_max)
		fading = false;
}

//Draw the shield
scDrawPiePart(x, y, 1, 1, color, radius, fading_alpha, width);

if (!fading) {
	timer--;
	if (timer <= 0) {
		fading = true;
		//True is fading out
		fading_type = true;
	}
}