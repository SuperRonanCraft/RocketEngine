/// @desc 
if (exit_created) {
	scDrawSpriteExt(exit_x, exit_y, sprite_index, image_index, noone, 
		portal_alpha, image_xscale, image_yscale);
} else {
	with (owner)
		scDrawPie(bbox_right + 15, y, other.timer, other.timer_org, c_dkgray, 10, 0.5);
}

draw_self();