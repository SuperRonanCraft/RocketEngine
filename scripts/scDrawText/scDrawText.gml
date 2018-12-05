/// @desc scDrawText(text, color, scale, alpha)
/// This adds a black shadow below all text!
/// @arg x
/// @arg y
/// @arg text
/// @arg color
/// @arg scale
/// @arg color-back*
/// @arg alpha*

var xx = argument[0];
var yy = argument[1];
var text = argument[2];
var c = argument[3];
var scale = argument[4];
var c2 = argument_count >= 6 ? (argument[5] == noone ? c_black : argument[5]) : c_black;
var alpha = argument_count >= 7 ? argument[6] : 1;

draw_text_transformed_color(xx + 2, yy + 2, text, scale, scale, 0, c2, c2, c2, c2, alpha);
draw_text_transformed_color(xx, yy, text, scale, scale, 0, c, c, c, c, alpha);