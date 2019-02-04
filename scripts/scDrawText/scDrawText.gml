/// @desc scDrawText(text, color, scale, alpha)
/// This adds a black shadow below all text!
/// @arg x
/// @arg y
/// @arg text
/// @arg color* set to "noone" to ignore
/// @arg scale* set to "noone" to ignore
/// @arg color-back* set to "noone" to ignore
/// @arg alpha* set to "noone" to ignore
/// @arg haligh* set to "noone" to ignore
/// @arg valigh* set to "noone" to ignore

var xx = argument[0];
var yy = argument[1];
var text = argument[2];
var c = argument_count >= 4 ? (argument[3] == noone ? c_white : argument[3]) : c_white;
var scale = argument_count >= 5 ? (argument[4] == noone ? 1 : argument[4]) : 1;
var c2 = argument_count >= 6 ? (argument[5] == noone ? c_black : argument[5]) : c_black;
var alpha = argument_count >= 7 ? (argument[6] != noone ? argument[6] : 1) : 1;
var haligh = argument_count >= 8 ? (argument[7] != noone ? argument[7] : fa_middle) : fa_middle;
var valigh = argument_count >= 9 ? (argument[8] != noone ? argument[8] : fa_middle) : fa_middle;

if (string_count("&", text) >= 1) {
	var pos = string_pos("&", text);
	switch (string_copy(text, pos, pos + 1)) {
		case "&a": c = c_lime; break;
		case "&b": c = c_aqua; break;
		case "&c": c = c_red; break;
		case "&d": c = c_fuchsia; break;
		case "&e": c = c_yellow; break;
		case "&f": c = c_white; break;
		case "&1": c = c_blue; break;
		case "&2": c = c_green; break;
		case "&3": c = c_teal; break;
		case "&4": c = c_red; break;
		case "&5": c = c_purple; break;
		case "&6": c = c_orange; break;
		case "&7": c = c_ltgray; break;
		case "&8": c = c_gray; break;
		case "&9": c = c_navy; break;
		case "&0": c = c_black; break;
	}
	text = string_delete(text, pos, pos + 1);
}

draw_set_halign(haligh);
draw_set_valign(valigh);

draw_text_transformed_color(xx + 2, yy + 2, text, scale, scale, 0, c2, c2, c2, c2, alpha);
draw_text_transformed_color(xx, yy, text, scale, scale, 0, c, c, c, c, alpha);