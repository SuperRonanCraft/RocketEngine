/// @desc draw the tip

if (not_enabled) { //Notifications
	scDrawText(RES_W - RES_W / 4, y, not_text_title, c_yellow, scale, noone, not_alpha, noone, fa_top); //Text
	scDrawText(RES_W - RES_W / 4, y + 25, not_text[| 0], c_gray, scale, noone, not_alpha, noone, fa_top); //Text
}

if ((global.play && alpha <= 0) || tip_delay_current > 0) exit; //Disabled, just exit
else if (global.play && tip_timer_frames > 0)
	tip_timer_frames = 0;
var xx = x, yy = y;
var tip = tip_current;
switch (tip_list[# 0, tip]) {
	case tip_element.sprite:
		var _scale = tip_list[# 4, tip];
		var _h = sprite_get_height(tip_list[# 1, tip]);
		var _w = sprite_get_width(tip_list[# 1, tip]);
		yy -= _h * _scale;
		var _w9 = (string_width(tip_list[# 3, tip]) * scale) / 2;
		var _h9 = (string_height(tip_list[# 3, tip]) * scale);
		scDrawNineSplice(sUIBox, xx - _w9 - buffer, yy - buffer - (string_height(tip_list[# 2, tip]) * scale), xx + _w9 + buffer, 
			yy + (buffer * 3) + (_h * _scale) + _h9, alpha, alpha / 2);
		scDrawText(xx, yy, tip_list[# 2, tip], color_title, scale, noone, alpha, fa_middle, fa_bottom); //Sprite name
		draw_sprite_part_ext(tip_list[# 1, tip], 0, 0, 0, _w, _h, xx - ((_w * _scale) / 2), yy + buffer, _scale, _scale, c_white, alpha); //Sprite icon
		scDrawText(xx, yy + (buffer * 2) + (_h * _scale), tip_list[# 3, tip], color_text, scale, noone, alpha, noone, fa_top); //Sprite desc
		break;
}