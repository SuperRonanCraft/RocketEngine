/// @desc draw timer and count down and endgame
//if (timer_enabled) {
	//Bar
	var xpos = RES_W / 2;
	var ypos = 18;
	var w = sprite_get_width(sTimerBar) * (timer_current / timer); //Target
	if (timer_current_width < w)
		timer_current_width = min(timer_current_width + 8, w);
	else if (timer_current_width > w)
		timer_current_width = max(timer_current_width - 1, w);
	var h = sprite_get_height(sTimerBar);
	draw_sprite_part_ext(sTimerBar, 0, 0, 0, timer_current_width, h, xpos - sprite_get_width(sTimerBar) / 2, ypos, 1, 1, c_white, 0.8); //Timer bar with color
	scDrawSpriteExt(xpos, ypos, sTimerBar, 1, c_white, 0.8); //Timer bar without color
	//Time
	scDrawText(RES_W / 2, 25, string(timer_current), c_black, 1, c_ltgray);
//}

//Game end draw events
if (endgame) {
	//Game has ended
	scDrawText(RES_W / 2, RES_H / 2, "GAME OVER!", c_red, 2);
	
	scDrawText(RES_W - 16, RES_H - RES_H / 16, "Continuing in " + 
	string(clamp(kick_timer, 1, kick_timer_display)) + "...", c_yellow, 0.6, noone, noone, fa_right);
}