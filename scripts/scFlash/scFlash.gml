/// @desc flash an object white
/// @arg sprite-index;
/// @arg sprite-image

if (flash_alpha > 0) {
	shader_set(shFlashAlpha);
	var sprite = argument0;
	var sprite_img = argument1;
	draw_sprite_ext(sprite, sprite_img, x, y, facing * image_xscale, image_yscale, 0, flash_color, flash_alpha);
	shader_reset();
	flash_alpha = max(flash_alpha - flash_reduce, 0);
}