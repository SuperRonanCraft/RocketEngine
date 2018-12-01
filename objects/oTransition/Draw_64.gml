//Draw Black Bars
if (mode != TRANS_MODE.OFF) {
	var val = 0.55;
	if (pre_mode == TRANS_MODE.OFF || pre_mode == TRANS_MODE.PAUSE || pre_mode == TRANS_MODE.UNPAUSE)
		if (mode == TRANS_MODE.PAUSE || mode == TRANS_MODE.UNPAUSE) {alpha = 0.25; val = 1;}
		else {alpha = 1; val = 1;}
	draw_set_alpha(alpha);
	draw_set_color(c_black);
	draw_rectangle(0, 0, w, percent * (h * val), false);
	draw_rectangle(0, h, w, h - (percent * (h * val)), false);
	draw_set_alpha(1);
}