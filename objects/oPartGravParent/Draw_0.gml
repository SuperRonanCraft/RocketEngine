/// @desc 

if (timer > 0)
	timer--;
else if (timer > -1)
	image_alpha = max(image_alpha - alpha_reduce, 0);

var _y = y;
if (animate && !moving)
	_y = _y + scMovementWave(-3, 3, animate_dur);
	
draw_sprite_ext(sprite_index,image_index,x,_y,image_xscale,image_yscale,angle,c_white,1);

if (scaled && image_xscale != 1 || image_yscale != 1) {
	image_xscale = min(1, image_xscale + 0.05);
	image_yscale = image_xscale;
}

if (image_alpha <= 0)
	instance_destroy();