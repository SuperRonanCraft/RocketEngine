/// @desc
if (endgame) {
	if (endgame_delay <= 0)
		event_inherited(); //Step buttons
	kick_timer_abs--;
	if (kick_timer_abs mod room_speed == 0)
		kick_timer--;
	if (kick_timer_abs <= 0 && kick_execute)
		SlideTransition(TRANS_MODE.GOTO, global.gamemodeSRoom[gamemode]);
}