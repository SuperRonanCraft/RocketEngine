/// @desc draw timer

draw_set_color(c_black);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
if (wait_timer > 0) {
	draw_text_transformed(RES_W / 2, RES_H / 2, string(wait_timer), wait_timer_scale, wait_timer_scale, 0);
	exit;
}
draw_line_width_color(RES_W / 4 - 2, 20, (RES_W / 2 + RES_W / 4) + 2, 20, 14, c_ltgray, c_ltgray);
draw_line_width_color(RES_W / 4, 20,  (RES_W / 4) + ((RES_W / 2) * (timer_current / timer)), 20, 10, c_red, c_green);
draw_text(RES_W / 2, 25, string(timer_current));