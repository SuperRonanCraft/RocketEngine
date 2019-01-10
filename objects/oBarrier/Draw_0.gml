/// @desc Draw tile sprite over
for (var i = 0; i < image_yscale; i++) {
	var val = (-((image_yscale / 2) * 32)) + (i * 32);
	draw_sprite_part(sWallTile, 0, 0, 0, 32, 32, x - 16, y + val);
}
