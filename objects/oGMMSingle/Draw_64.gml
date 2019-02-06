/// @desc 


//Game end draw events
if (endgame) {
	//Game has ended
	scDrawText(RES_W / 2, RES_H / 2, "GAME OVER!", c_red, 2);
	if (endgame_delay <= 0) { //When the game delay has been reached
		event_user(4);
		event_inherited(); //Draw ui buttons
	}
	if (kick_timer_display >= kick_timer)
		scDrawText(RES_W - RES_W / 8, RES_H - RES_H / 16, "Continuing in " + string(clamp(kick_timer, 1, kick_timer_display)) + "...", c_yellow, 0.6);
}