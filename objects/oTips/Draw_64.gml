/// @desc draw the tip

if (not_enabled) { //Notifications
	scDrawText(RES_W / 2 + RES_W / 4, y, not_text_title, c_yellow, scale, noone, not_alpha, noone, fa_top); //Text
	scDrawText(RES_W / 2 + RES_W / 4, y + 25, not_text[| 0], c_gray, scale, noone, not_alpha, noone, fa_top); //Text
}

if (global.play || tip_delay_current > 0) exit; //Disabled, just exit

var xx = x, yy = y;
var tip = tip_current;
switch (tip_list[# 0, tip]) {
	case tip_element.sprite:
		scDrawText(xx, yy, tip_list[# 2, tip], color_title, scale, noone, alpha); //Sprite name
		draw_sprite_ext(tip_list[# 1, tip], 0, xx, yy + 25, 1, 1, 0, c_white, alpha); //Sprite icon
		scDrawText(xx, yy + 50, tip_list[# 3, tip], color_text, scale, noone, alpha, noone, fa_top); //Sprite desc
		break;
	case tip_element.sprite_buff:
		scDrawText(xx, yy, tip_list[# 2, tip], color_title, scale, noone, alpha); //Sprite name
		draw_sprite_ext(tip_list[# 1, tip], 0, xx - 16, yy + 25 - 16, 0.5, 0.5, 0, c_white, alpha); //Sprite icon
		scDrawText(xx, yy + 50, tip_list[# 3, tip], color_text, scale, noone, alpha, noone, fa_top); //Sprite desc
		break;
	case tip_element.text:
		scDrawText(xx, yy, tip_list[# 1, tip], color_text, scale, noone, alpha, noone, fa_top); //Text
		break;
}