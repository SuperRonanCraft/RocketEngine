/// @arg x
/// @arg y
/// @arg rad
/// @arg color
/// @arg outline
/// @arg alpha

var xx = argument0, yy = argument1, rad = argument2;
var color = argument3, outline = argument4, alpha = argument5;

draw_set_alpha(alpha);
draw_circle_color(xx, yy, rad, color, color, outline);
draw_set_alpha(1);