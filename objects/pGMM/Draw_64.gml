/// @desc draw timer and count down

var c = c_black, c2 = c_gray;
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
//Count down
if (wait_timer > 0) {
	var c3 = c_orange
	draw_text_transformed_color(RES_W / 2 + 2, RES_H / 2 + 2, string(wait_timer), wait_timer_scale * 2, wait_timer_scale * 2, 0, c2, c2, c2, c2, 1);
	draw_text_transformed_color(RES_W / 2, RES_H / 2, string(wait_timer), wait_timer_scale * 2, wait_timer_scale * 2, 0, c3, c3, c3, c3, 1);
}
//Bar
var xpos = RES_W / 4;
var ypos = 18;
var w = sprite_get_width(sTimerBar) * (timer_current / timer);
var h = sprite_get_height(sTimerBar);
draw_sprite_part_ext(sTimerBar, 0, 0, 0, w, h, xpos, ypos, 1, 1, c_white, 0.8);
draw_sprite_ext(sTimerBar, 1, xpos, ypos, 1, 1, 0, 0, 0.8);
//draw_line_width_color(RES_W / 4 - 2, 20, (RES_W / 2 + RES_W / 4) + 2, 20, 14, c2, c2);
//draw_line_width_color(RES_W / 4, 20,  (RES_W / 4) + ((RES_W / 2) * (timer_current / timer)), 20, 10, c_red, c_green);
//Time
draw_text_color(RES_W / 2 + 2, 25 + 2, string(timer_current), c2, c2, c2, c2, 1);
draw_text_color(RES_W / 2, 25, string(timer_current), c, c, c, c, 1);