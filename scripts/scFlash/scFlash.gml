/// @desc flash an object white
/// @arg flash-alpha
/// @arg flash-color
/// @arg xscale
/// @arg yscale
/// @arg sprite-index;
/// @arg sprite-image
/// @arg x
/// @arg y
function scFlash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, angle=0) {

	var alpha = argument0;

	if (alpha > 0) {
		shader_set(shFlashAlpha);
		draw_sprite_ext(argument4, argument5, argument6, argument7, argument2, argument3, angle, argument1, alpha);
		shader_reset();
	}


}


function scFlashOutl(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, angle=0) {

	var alpha = argument0;

	if (alpha > 0) {
		shader_set(shFlashAlphaOutl);
		draw_sprite_ext(argument4, argument5, argument6, argument7, argument2, argument3, angle, argument1, alpha);
		shader_reset();
	}


}