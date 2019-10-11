/// @desc Movement Draw GUI

var _xx = tab_w + tab_buf;
var _yy = tab_y - tab_buf - (tab_buf / 2);

var _w = sprite_get_width(sUISliderBar) + (tab_buf * 2);
scDrawRectRound(_xx, _yy, _xx + _w, _yy + RES_H / 4, c_white, false, alpha, 8, 8);
var _scale = 0.4;
var _h = string_height("HSP") * _scale;

//HSP MOD
_yy += tab_buf;
scDrawText(_xx + (_w / 2), _yy, "HSP MOVE MOD", c_yellow, _scale, noone, alpha, fa_middle, fa_top);
_yy += tab_buf + _h;
_xx += tab_buf;
scDrawSpriteExt(_xx, _yy + 4, sUISliderBar, 0, noone, alpha);

var value_max = 50;
var value = tab_map[? "move_hspmovemod"] != undefined ? tab_map[? "move_hspmovemod"] : 25;
var _width = sprite_get_width(sUISliderBar);
var _scale_btn = 1;
if (scUIHoveringBox(_xx, _yy, _xx + _width, _yy + 8, tab_buf, tab_buf)) {
	if (mouse_check_button(mb_left)) { //Drag value
		var xmiddle = _xx + (_width / 2);
		tab_map[? "move_hspmovemod"] = ((device_mouse_x_to_gui(0) - xmiddle) / _width) * (value_max * 2);
		tab_map[? "move_hspmovemod"] = clamp(floor(tab_map[? "move_hspmovemod"]), -value_max, value_max)
		value = tab_map[? "move_hspmovemod"];
	}
	_scale_btn *= 1.2;
}
var offset = (_width / (value_max * 2)) * value;
scDrawSpriteExt(_xx + (_width / 2) + offset, _yy + 4, sUISliderButton, 0, noone, alpha, _scale_btn, _scale_btn); //Button
_yy += tab_buf;
scDrawText(_xx - tab_buf + (_w / 2), _yy, string(value), c_yellow, _scale, noone, alpha, fa_middle, fa_top); //Value
_yy += tab_buf;
//APPLY
if (scUIHoveringBox(_xx, _yy, _xx + _width, _yy + 8, tab_buf, tab_buf)) {
	if (mouse_check_button(mb_left)) { //Drag value
		var xmiddle = _xx + (_width / 2);
		tab_map[? "move_hspmovemod"] = ((device_mouse_x_to_gui(0) - xmiddle) / _width) * (value_max * 2);
		tab_map[? "move_hspmovemod"] = clamp(floor(tab_map[? "move_hspmovemod"]), -value_max, value_max)
		value = tab_map[? "move_hspmovemod"];
	}
	_scale_btn *= 1.2;
}
_xx -= tab_buf;
var _text = ["Apply", "Reset"];
var _text_len = string_length(_text[0]) * _scale;
_yy += tab_buf;
scDrawRectRound(_xx + (_w / 2) - (tab_buf * 2) - _text_len, _yy - tab_buf, _xx + (_w / 2) - tab_buf, _yy + _h + tab_buf, c_lime, false, alpha, 8, 8); //Button
scDrawText(_xx + (_w / 2) - (tab_buf * 2), _yy, string(value), c_yellow, _scale, noone, alpha, fa_right, fa_top); //Value
//RESET

//VSP MOD