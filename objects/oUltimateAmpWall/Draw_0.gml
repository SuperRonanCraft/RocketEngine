/// @desc

var xx = x;
var yy = y + (32 * (image_yscale - 1));
for (var i = 0; i < build_at; i++) {
	var newy = yy;
	if (i == (build_at - 1))
		newy = yy - build_at_offset_crt;
	scDrawSpriteExt(xx, newy, sprite_index, image_index, noone, image_alpha);
	yy -= 32;
}

//Build up
if (build_at <= image_yscale) {
	build_at_offset_crt = max(build_at_offset_crt - 1, 0);
	if (build_at < image_yscale && build_at_offset_crt <= 0) {
		build_at_offset_crt = build_at_offset;
		build_at++;
	}
}

if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, image_alpha);