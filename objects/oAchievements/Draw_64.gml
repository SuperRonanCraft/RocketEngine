/// @desc display achievement

if (!achievement_display || ds_list_empty(achievement_display_list)) exit;

var name = scAchievementsGetType(ACHIEVEMENT_TYPE.NAME, achievement_display_list[| 0]);
var desc = scAchievementsGetType(ACHIEVEMENT_TYPE.DESCRIPTION, achievement_display_list[| 0]);
var name_len = string_width(name) * ach_scale;
var len = ach_title_len > name_len ? ach_title_len : name_len;
var hei = ach_title_hei * 2;
var xx = ach_x_crt, xx2 = xx + len + (ach_margin * 2);
var yy = ach_ystart, yy2 = yy + hei + (ach_margin * 2);
scDrawRectRound(xx, yy, xx2 + 20, yy2, c_gray, false, ach_box_alpha, 20, 20);
//TITLE
//xx = xx + ((xx2 - xx) / 2);
yy = yy + ((yy2 - yy) / 2);
scDrawText(xx + ach_margin, yy, ach_title, c_yellow, ach_scale, noone, ach_alpha, fa_left, fa_bottom);
//NAME
scDrawText(xx + ach_margin, yy, name, c_white, ach_scale, noone, ach_alpha, fa_left, fa_top);
//DESC
scDrawText(xx + ach_margin, yy + (ach_title_hei * 1.5), desc, c_ltgray, ach_scale_desc, noone, ach_alpha, fa_left, fa_top);

scDrawRect(RES_W, ach_ystart, RES_W - (RES_W - xx2) + 20, yy2, c_black, false, 1); //blackout bar (not show when full screened)

//travelled, slow down at
var half = ((len + (ach_margin * 2)) / 3);
var spd = ach_xstart - ach_x_crt > half ? (half / (ach_xstart - ach_x_crt)) * ach_speed : ach_speed;
ach_x_crt = ach_openning ? max(ach_x_crt - spd, ach_xstart - (len + (ach_margin * 2))) : min(ach_x_crt + spd, ach_xstart);

if (ach_x_crt >= ach_xstart) { //Delete just shown achievement
	ds_list_delete(achievement_display_list, 0);
	ach_openning = true;
	ach_playedsound = false;
} else if (ach_x_crt <= ach_xstart - (len + (ach_margin * 2))) { //Pause
	if (ach_pause_time_crt <= 0) {
		ach_openning = false;
		ach_pause_time_crt = ach_pause_time;
	} else
		ach_pause_time_crt--;
} else if (!ach_playedsound) {
	scPlaySound(SOUND.ACH_WHOOSH);
	ach_playedsound = true;
}
if (ds_list_empty(achievement_display_list)) { //Ended showing all achievements
	achievement_display = false;
	ach_openning = true;
}

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
