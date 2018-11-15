//Size Variables and Mode Setup

w = display_get_gui_width();
h = display_get_gui_height();
h_half = w / 2;

enum TRANS_MODE {
	OFF, NEXT, GOTO, RESTART, INTRO, PAUSE, UNPAUSE, ONE_V_ONE
}

mode = TRANS_MODE.INTRO;
pre_mode = mode;
alpha = 1;
percent = 1;
target = room;
depth -= 1;