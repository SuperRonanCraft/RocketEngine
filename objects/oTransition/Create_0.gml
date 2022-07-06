//Size Variables and Mode Setup

w = RES_W;
h = RES_H;

enum TRANS_MODE {
	OFF, NEXT, GOTO, RESTART, INTRO, PAUSE, UNPAUSE, ONE_V_ONE
}

mode = TRANS_MODE.INTRO;
pre_mode = mode;
alpha = 1;
timer = 0;
percent = 1;
target = room;
depth -= 1;