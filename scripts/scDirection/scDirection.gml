//Direction

//Change direction of xscale depending on where we're facing
if (hsp != 0)
	facing = sign(hsp);
	
//Draw sprite with modified direction
//TEMPORARY
draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, 1);