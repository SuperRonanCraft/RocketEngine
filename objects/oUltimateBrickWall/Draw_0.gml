/// @desc

var yy = y + (32 * (walls_tospawn - 1));
for (var i = 0; i < build_at; i++) {
	var xx = x + ((walls_side * i) * 32);
	var yy = y - (i * 32);
	if (i == (build_at - 1))
		yy -= build_at_offset_crt;
	repeat (i != 0 ? walls_thickness : 1) {
		scDrawSpriteExt(xx, yy, sprite_index, 0, noone, image_alpha);
		yy += 32;
	}
	if (i > 1)
		scDrawSpriteExt(xx + (walls_side == -1 ? 32 : 0), yy, sprite_index, 1, noone, image_alpha, walls_side);
}

//Build up
if (build_at <= walls_tospawn) {
	build_at_offset_crt = max(build_at_offset_crt - 1, 0);
	if (build_at < walls_tospawn && build_at_offset_crt <= 0) {
		build_at_offset_crt = build_at_offset;
		build_at++;
	}
}

if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, image_alpha);