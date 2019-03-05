/// @desc draw circle

scDrawSpriteExt(x, y, sprite_index, 2, noone, image_alpha - 0.1, image_xscale, max((jump_ani / jump_ani_max) * 2, 1), 0);
scDrawSpriteExt(x, y, sprite_index, 0, noone, image_alpha, image_xscale, image_yscale, 0);
scDrawSpriteExt(x, y - jump_ani, sprite_index, 1, noone, image_alpha, image_xscale, image_yscale, 0);
jump_ani = max(jump_ani - 1, 0);

if (global.debug) {
	//jump box
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, true, 1);
	//ignore list
	scDrawRect(bbox_left - margin_x, bbox_top - margin_y, bbox_right + margin_x, 
		bbox_bottom + margin_y, c_blue, true, 1);
}