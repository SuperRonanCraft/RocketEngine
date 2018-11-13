/// @desc change direction respection movement
/// @arg face-movement

//Change direction of xscale depending on where we're facing
if (argument0)
	if (hsp != 0 && hsp_move != 0)
		facing = sign(hsp);
	
//Draw sprite with modified direction
//TEMPORARY
draw_sprite_ext(sprite_index, image_index, x, y, argument0 ? facing : image_xscale, argument0 ? 1 : image_yscale, 0, c_white, image_alpha);