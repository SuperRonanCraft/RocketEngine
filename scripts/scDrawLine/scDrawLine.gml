/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg color
/// @arg width
/// @arg alpha

var x1 = argument0, y1 = argument1, x2 = argument2, y2 = argument3;
var c = argument4, width = argument5, alpha = argument6;

draw_set_alpha(alpha);
draw_line_width_color(x1, y1, x2, y2, width, c, c);
draw_set_alpha(1);