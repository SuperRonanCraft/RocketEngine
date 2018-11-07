/// @desc Sprite look Direction

if (hsp != 0)
	facing = sign(hsp);

//Draw sprite with modified direction
draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, 1);