/// @desc draw circle

draw_self();

var yy = bbox_top - 10 - (timer_width + timer_margin), xx = x - (timer_len / 2);
var percent = other.timer / other.timer_org;
scDrawLine(xx - (timer_margin / 2), yy, xx + timer_len + (timer_margin / 2), yy, c_gray, timer_width + timer_margin, image_alpha - 0.5);
scDrawLine(xx, yy, xx + (percent * timer_len), yy, c_fuchsia, timer_width, image_alpha - 0.5);

var xx = x - (35 * image_xscale);
var yy = bbox_bottom;
for (var i = 0; i < turret_hp_org; i++) {
	var size = i <= turret_hp + (turret_hp_damaged - 1) ? turret_hp_damaged_size : 1;
	yy -= 5;
	scDrawLine(xx, yy, xx + 10, yy, turret_hp > i ? c_lime : c_gray, 2 * size, image_alpha - 0.5);
}
turret_hp_damaged_size = max(turret_hp_damaged_size - turret_hp_damaged_size_amt, 1);
