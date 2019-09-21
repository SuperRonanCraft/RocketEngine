/// @desc 

if (timer > 0)
	timer--;
else
	image_alpha = max(image_alpha - alpha_reduce, 0);
draw_self();

if (image_alpha <= 0)
	instance_destroy();