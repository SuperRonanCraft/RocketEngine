//Draw Black Bars
if (mode != TRANS_MODE.OFF) {
	if (mode == TRANS_MODE.PAUSE || mode == TRANS_MODE.UNPAUSE)
		draw_set_alpha(0.1);
	draw_set_color(c_black);
	draw_rectangle(0, 0, w, percent * h, false);
	draw_rectangle(0, h, w, h - (percent * h), false);
	draw_set_alpha(1);
}