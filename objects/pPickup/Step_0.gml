/// @description animate in place
y = ystart + scMovementWave(-3, 3, 2);
if (timer > timer_original * 0.15)
	image_alpha = min(image_alpha + 0.05, alpha_max);
else
	image_alpha = max(image_alpha - 0.05, 0);
if (image_alpha == 0)
	instance_destroy();
timer--;