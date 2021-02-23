/// @arg x
/// @arg y
/// @arg rad
/// @arg color
/// @arg outline
/// @arg alpha
function scDrawCircle(argument0, argument1, argument2, argument3, argument4, argument5) {

	var xx = argument0, yy = argument1, rad = argument2;
	var color = argument3, outline = argument4, alpha = argument5;

	draw_set_alpha(alpha);
	draw_circle_color(xx, yy, rad, color, color, outline);
	draw_set_alpha(1);


}
