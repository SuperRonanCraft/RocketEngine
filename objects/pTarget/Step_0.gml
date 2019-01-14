/// @desc despawn

if (timer > 0 && hp > 0) {
	timer--;
	image_alpha = min(image_alpha + alpha_reduction, 1);
} else {
	image_alpha = max(image_alpha - alpha_reduction, 0);
	if (image_alpha <= 0)
		instance_destroy();
}