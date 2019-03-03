/// @desc draw circle

//Base
scDrawSpriteExt(x, y, sprite_index, 0, noone, image_alpha, image_xscale, image_yscale, 0);
//Cannon
//turret_offset = max(turret_offset - 1, 0);
//scDrawSpriteExt(x - (turret_offset * image_xscale), y, 
//sprite_index, 0, noone, image_alpha, image_xscale, image_yscale, turret_offset * image_xscale);

if (global.debug) {
	//jump box
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, true, 1);
	//ignore list
	scDrawRect(bbox_left - margin_x, bbox_top - margin_y, bbox_right + margin_x, 
		bbox_bottom + margin_y, c_blue, true, 1);
}