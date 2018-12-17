/// @desc scDrawText(text, color, scale, alpha)
/// This adds a black shadow below all text!
/// @arg x
/// @arg y
/// @arg text
/// @arg color
/// @arg scale*
/// @arg color-back* set to "noone" to ignore
/// @arg alpha* set to "noone" to ignore
/// @arg haligh* set to "noone" to ignore
/// @arg valigh* set to "noone" to ignore

var xx = argument[0];
var yy = argument[1];
var text = argument[2];
var c = argument[3];
var scale = argument_count >= 5 ? (argument[4] == noone ? 1 : argument[4]) : 1;
var c2 = argument_count >= 6 ? (argument[5] == noone ? c_black : argument[5]) : c_black;
var alpha = argument_count >= 7 ? (argument[6] != noone ? argument[6] : 1) : 1;
var haligh = argument_count >= 8 ? (argument[7] != noone ? argument[7] : fa_middle) : fa_middle;
var valigh = argument_count >= 9 ? (argument[8] != noone ? argument[8] : fa_middle) : fa_middle;

draw_set_halign(haligh);
draw_set_valign(valigh);

draw_text_transformed_color(xx + 2, yy + 2, text, scale, scale, 0, c2, c2, c2, c2, alpha);
draw_text_transformed_color(xx, yy, text, scale, scale, 0, c, c, c, c, alpha);