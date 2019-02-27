/// @desc despawn

if (placed) {
	timer--;
	if (timer <= 0) {
		image_alpha = max(image_alpha - alpha_change, 0);
		if (image_alpha <= 0)
			instance_destroy();
	}
} else {
	image_alpha = min(image_alpha + alpha_change, alpha_max);
	if (image_alpha >= alpha_max)
		placed = true;
}
