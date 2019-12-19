/// @description  


if (sprite_index != noone)
	draw_self();


//Show shuriken collision box while in debug mode
if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);