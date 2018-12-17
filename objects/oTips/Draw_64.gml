/// @desc draw the tip

if (global.play || tip_delay_current > 0) exit; //Disabled, just exit

var tip = tip_current;
var xx = x, yy = y;
switch (tip_list[# 0, tip]) {
	case tip_element.sprite:
		scDrawText(xx, yy, tip_list[# 2, tip], c_white, scale, noone, alpha); //Sprite name
		draw_sprite_ext(tip_list[# 1, tip], 0, xx, yy + 25, 1, 1, 0, c_white, alpha); //Sprite icon
		scDrawText(xx, yy + 50, tip_list[# 3, tip], c_white, scale, noone, alpha, noone, fa_top); //Sprite desc
		break;
	case tip_element.text:
		scDrawText(xx, yy, tip_list[# 1, tip], c_white, scale, noone, alpha, noone, fa_top); //Text
		break;
}