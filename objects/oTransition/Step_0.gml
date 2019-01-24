/// @desc Progress Transitions
if (mode == TRANS_MODE.OFF) exit;
if (mode == TRANS_MODE.INTRO || mode == TRANS_MODE.UNPAUSE)
	percent = max(0, percent - max((percent / 10), 0.0005));
else
	percent = min(1, percent +  max(((1 - percent) / 10), 0.01));
//What to do after animation is done either filling or leaving
if (percent == 1 || percent == 0)
	switch (mode) {
		case TRANS_MODE.GOTO:
			mode = TRANS_MODE.INTRO;
			global.pause_possible = true;
			room_goto(target);
			break;
		case TRANS_MODE.RESTART:
			mode = TRANS_MODE.INTRO;
			if (room != rMenu)
				room_goto(rMenu);
			break;
		case TRANS_MODE.PAUSE: 
			//PAUSED
			break;
		case TRANS_MODE.UNPAUSE:
			//UNPAUSED
			mode = TRANS_MODE.OFF;
			break;
		case TRANS_MODE.INTRO: default:
			mode = TRANS_MODE.OFF;
			break;
	}