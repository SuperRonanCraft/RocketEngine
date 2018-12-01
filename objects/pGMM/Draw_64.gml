/// @desc draw timer and count down and endgame

//var c = c_black, c2 = c_gray;
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
//Count down
if (wait_timer > 0) {
	//var c3 = c_orange
	scDrawText(RES_W / 2, RES_H / 2, string(wait_timer), c_orange, wait_timer_scale * 2);
	//draw_text_transformed_color(RES_W / 2 + 2, RES_H / 2 + 2, string(wait_timer), wait_timer_scale * 2, wait_timer_scale * 2, 0, c2, c2, c2, c2, 1);
	//draw_text_transformed_color(RES_W / 2, RES_H / 2, string(wait_timer), wait_timer_scale * 2, wait_timer_scale * 2, 0, c3, c3, c3, c3, 1);
}
//Bar
var xpos = RES_W / 4;
var ypos = 18;
var w = sprite_get_width(sTimerBar) * (timer_current / timer);
var h = sprite_get_height(sTimerBar);
draw_sprite_part_ext(sTimerBar, 0, 0, 0, w, h, xpos, ypos, 1, 1, c_white, 0.8);
draw_sprite_ext(sTimerBar, 1, xpos, ypos, 1, 1, 0, 0, 0.8);
//Time
scDrawText(RES_W / 2, 25, string(timer_current), c_black, 1, c_ltgray);

//Game end draw events
if (endgame) {
	//Game has ended
	scDrawText(RES_W / 2, RES_H / 2, "GAME OVER!", c_red, 2);
	if (endgame_delay <= 0) //The moment a game ended
		event_user(4);
}