/// @desc flash an object white
/// @arg flash-alpha
/// @arg flash-color
/// @arg xscale
/// @arg yscale
/// @arg sprite-index;
/// @arg sprite-image
/// @arg x
/// @arg y

var alpha = argument0;

if (alpha > 0) {
	shader_set(shFlashAlpha);
	draw_sprite_ext(argument4, argument5, argument6, argument7, argument2, argument3, 0, argument1, alpha);
	shader_reset();
}