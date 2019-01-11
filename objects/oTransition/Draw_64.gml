//Draw Black Bars
if (mode != TRANS_MODE.OFF) {
	var val = 0.55;
	if (pre_mode == TRANS_MODE.OFF || pre_mode == TRANS_MODE.PAUSE || pre_mode == TRANS_MODE.UNPAUSE)
		if (mode == TRANS_MODE.PAUSE || mode == TRANS_MODE.UNPAUSE) {alpha = 0.25; val = 1;}
		else {alpha = 1; val = 1;}
	scDrawRect(0, 0, w, percent * (h * val), c_black, false, alpha);
	scDrawRect(0, h, w, h - (percent * (h * val)), c_black, false, alpha);
}