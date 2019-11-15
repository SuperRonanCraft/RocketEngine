/// @desc 

if (timer > 0)
	timer--;
else
	image_alpha = max(image_alpha - alpha_reduce, 0);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);


if (image_alpha <= 0)
	instance_destroy();