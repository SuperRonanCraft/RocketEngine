/// @desc Wait delay before starting stage, if allowed to play, call countdown delay every second
if (timer_enabled && !endgame)
	if (wait_timer_current >= 0) {
		wait_timer_current_abs--;
		if (wait_timer_current_abs == 0) {
			wait_timer_current--;
			wait_timer_scale = 3;
			wait_timer_current_abs = room_speed;
			wait_timer_text = string(wait_timer_current);
			switch (wait_timer_current) {
				case 2: wait_timer_color = c_orange; break;
				case 1: wait_timer_color = c_yellow; break;
				case 0: wait_timer_color = c_lime; wait_timer_text = wait_timer_go; break;
				default: wait_timer_color = c_red; break;
			}
			if (wait_timer_current <= 0)
				global.play = true;
		}
		wait_timer_scale = max(wait_timer_scale * 0.95, 1);
		exit;
	} else if (global.play && !endgame) {
		if (timer_room <= 0)
			timer_room = room_speed;
		else 
			timer_room--;
		if (timer_room == 0)
			event_user(0);
	}
//End of game event
if (endgame) {
	event_user(2);
	if (endgame_delay <= 0)
		event_inherited(); //Navigate UI
	kick_timer_abs--;
	if (kick_timer_abs mod room_speed == 0)
		kick_timer--;
	if (kick_timer_abs <= 0 && kick_execute)
		SlideTransition(TRANS_MODE.GOTO, global.gamemodeSRoom[gamemode]);
}