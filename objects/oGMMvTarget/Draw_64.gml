/// @desc draw score
event_inherited();
draw_set_font(points_font);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var changed = points_current != points;
points_current = points;
points_str = points_str_pre + string(points_current);
//Score text
scDrawText(points_x, points_y, points_str, c_black, points_scale, c_ltgray);
if (changed)
	scPlaySound(SOUND.EFFECT_TARGET_HIT);