/// @desc

var xx = x;
var yy = y + (32 * (image_yscale - 1));
for (var i = 0; i < image_yscale; i++) {
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, sprite_width * (build_per / build_per_max), sprite_height,
	x, yy, 1, 1, c_white, image_alpha);
	yy -= 32;
}

build_per = min(build_per + build_speed, build_per_max);

if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);