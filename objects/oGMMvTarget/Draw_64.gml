/// @desc draw score
event_inherited();
draw_set_font(points_font);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
var changed = points_current != points;
points_current = points;
points_str = points_str_pre + string(points_current);
draw_set_color(c_black);
draw_text_transformed(points_x + 2, points_y + 2, points_str, points_scale, points_scale, 0);
draw_set_color(c_white);
draw_text_transformed(points_x, points_y, points_str, points_scale, points_scale, 0);
if (changed)
	audio_play_sound(SOUND.GP_TARGET_HIT, 1, false);