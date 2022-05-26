/// @desc draw timer and count down and endgame


//Game end draw events
if (endgame) {
	//Game has ended
	scDrawText(RES_W / 2, RES_H / 2, "GAME OVER!", c_red, 2);
	
	scDrawText(RES_W - 16, RES_H - RES_H / 16, "Continuing in " + 
	string(clamp(kick_timer, 1, kick_timer_display)) + "...", c_yellow, 0.6, noone, noone, fa_right);
}
