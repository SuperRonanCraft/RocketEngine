/// @desc draw score
event_inherited();
draw_set_font(points_font);
var changed = points_current != points;
points_current = points;
points_str = points_str_pre + string(points_current);
//Score text
scDrawText(points_x, points_y, points_str, c_black, points_scale, c_ltgray, noone, fa_right, fa_top);
if (changed)
	scPlaySound(SOUND.EFFECT_TARGET_HIT);