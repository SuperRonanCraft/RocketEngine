/// @desc display achievement

if (!achievement_display || ds_list_empty(achievement_display_list)) exit;

var desc = scAchievementGetDescription(achievement_display_list[| 0]);
var desc_len = string_width(desc) * ach_scale;
var len = ach_title_len > desc_len ? ach_title_len : desc_len;
var hei = ach_title_hei + (string_height(desc) * ach_scale);
var xx = ach_x_crt, xx2 = xx + len + (ach_margin * 2);
var yy = ach_ystart, yy2 = yy + hei + (ach_margin * 2);
scDrawRect(xx, yy, xx2, yy2, c_gray, false, ach_box_alpha);
//TITLE
xx = xx + ((xx2 - xx) / 2);
yy = yy + ((yy2 - yy) / 2);
scDrawText(xx, yy, ach_title, c_yellow, ach_scale, noone, ach_alpha, fa_middle, fa_bottom);
//DESC
scDrawText(xx, yy, desc, c_white, ach_scale, noone, ach_alpha, fa_middle, fa_top);

//travelled, slow down at
var half = ((len + (ach_margin * 2)) / 2);
var spd = ach_xstart - ach_x_crt > half ? (half / (ach_xstart - ach_x_crt)) * ach_speed : ach_speed;
ach_x_crt = ach_openning ? max(ach_x_crt - spd, ach_xstart - (len + (ach_margin * 2))) : min(ach_x_crt + spd, ach_xstart);


if (ach_x_crt >= ach_xstart) {
	ds_list_delete(achievement_display_list, 0);
	ach_openning = true;
} else if (ach_x_crt <= ach_xstart - (len + (ach_margin * 2))) {
	if (ach_pause_time_crt <= 0) {
		ach_openning = false;
		ach_pause_time_crt = ach_pause_time;
	} else
		ach_pause_time_crt--;
}
if (ds_list_empty(achievement_display_list)) {
	achievement_display = false;
	ach_openning = true;
}
ach_display_time_crt = ach_display_time;

if (global.debug) {
	var xx3 = RES_W - 10;
	var yy3 = RES_H / 2;
	var str =	"Achievements Debug:" + "\n" +
				"Travelled: " + string(ach_xstart - ach_x_crt) + "\n" +
				"MULTI: " + string(half / (ach_xstart - ach_x_crt)) + "\n" +
				"SPEED: " + string(spd) + "\n" +
				"TO DISPLAY: " + string(ds_list_size(achievement_display_list)) + "\n" +
				"PAUSED: " + string(ach_pause_time_crt);
				
	scDrawText(xx3, yy3 - 15, str, noone, 0.3, noone, noone, fa_right);
}
