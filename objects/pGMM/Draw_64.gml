/// @desc draw timer and count down and endgame

//var c = c_black, c2 = c_gray;
//Count down
if (wait_timer_current >= 0)
	scDrawText(RES_W / 2, RES_H / 2, wait_timer_text, wait_timer_color, wait_timer_scale * 2, noone, noone, fa_middle, fa_middle); //Count down timer
//Bar
var xpos = RES_W / 4;
var ypos = 18;
var w = sprite_get_width(sTimerBar) * (timer_current / timer);
var h = sprite_get_height(sTimerBar);
draw_sprite_part_ext(sTimerBar, 0, 0, 0, w, h, xpos, ypos, 1, 1, c_white, 0.8); //Timer bar with color
draw_sprite_ext(sTimerBar, 1, xpos, ypos, 1, 1, 0, 0, 0.8); //Timer bar without color
//Time
scDrawText(RES_W / 2, 25, string(timer_current), c_black, 1, c_ltgray);

//Game end draw events
if (endgame) {
	//Game has ended
	scDrawText(RES_W / 2, RES_H / 2, "GAME OVER!", c_red, 2);
	if (endgame_delay <= 0) { //When the game delay has been reached
		event_user(4);
		event_inherited(); //Draw ui buttons
	}
	if (kick_timer_display >= kick_timer)
		scDrawText(RES_W - RES_W / 8, RES_H - RES_H / 16, "Continuing in " + string(clamp(kick_timer, 1, kick_timer_display)) + "...", c_white, 0.6);
}