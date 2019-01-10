/// @desc tile across height
for (var i = 0; i < image_yscale; i++) {
	var val = i * 32;
	draw_set_alpha(0.5);
	draw_sprite_part(sWallTile, 0, 0, 0, 32, 32, x - 16, y + val);
	draw_set_alpha(1);
}
