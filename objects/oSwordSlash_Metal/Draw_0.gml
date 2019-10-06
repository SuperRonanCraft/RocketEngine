/// @description  
draw_self();

if(sprite_index == sprite_proj)
	draw_sprite(sShuriken_Metal_SlashWave,image_index,x + (.25*image_xscale * sprite_width),y);


if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);