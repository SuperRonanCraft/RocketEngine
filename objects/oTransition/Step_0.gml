/// @desc Progress Transitions
if (mode != TRANS_MODE.OFF) {
	if (mode == TRANS_MODE.INTRO || mode == TRANS_MODE.UNPAUSE)
		percent = max(0, percent - max((percent / 10), 0.005));
	else
		percent = min(1, percent + max(((1 - percent) / 10), 0.005));
	if (percent == 1 || percent == 0)
		switch (mode){
			case TRANS_MODE.NEXT: {
				mode = TRANS_MODE.INTRO;
				if (room_next(room) != Background)
					room_goto_next();
				else 
					room_goto(Room1);
				break;
			}
			case TRANS_MODE.GOTO: {
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
			case TRANS_MODE.RESTART: {
				mode = TRANS_MODE.INTRO;
				global.inmenu = true;
				if (room == rMenu)
					room_restart();
				else 
					room_goto(rMenu);
				break;
			}
			case TRANS_MODE.INTRO: default: {
				mode = TRANS_MODE.OFF
				break;
			}
			case TRANS_MODE.PAUSE: {
				//PAUSED
				break;
			}
			case TRANS_MODE.UNPAUSE: {
				//UNPAUSED
				break;
			}
			case TRANS_MODE.ONE_V_ONE: {
				mode = TRANS_MODE.INTRO;
				room_goto(r1v1);
				break;
			}
		}
}