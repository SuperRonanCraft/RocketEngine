/// @desc Movement

var _xx = tab_w + (tab_buf * 2);
var _yy = tab_y - tab_buf - (tab_buf / 2);

var _mods = [["HSP MOVE MOD", "move_hspmovemod", 5]];
var _w = sprite_get_width(sUISliderBar) + (tab_buf * 2);
var _scale_o = 0.4
var _scale = _scale_o;
var _h = string_height("HSP") * _scale;
var _height = ((tab_buf * 4) + (_h * 3)) * array_length_1d(_mods);
var desc = tab_map[? "players"] == noone ? "Select a Player!" : noone;
var desc_h = desc != noone ? string_height(desc) * 0.4 : 0;
scDrawRectRound(_xx - tab_buf, _yy, _xx + _w + tab_buf, _yy + _height + desc_h, c_white, false, alpha, 8, 8);
if (desc != noone)
	scDrawText(_xx + (_w / 2), _yy + _height, desc, c_fuchsia, 0.4, noone, alpha, fa_middle, fa_top);
_xx += tab_buf;

//HSP MOD
_yy += tab_buf;
for (var i = 0; i < array_length_1d(_mods); i++) {
	_yy += tab_buf + _h;
	var mods = _mods[i];
	scDrawText(_xx + (_w / 2) - tab_buf, _yy - (tab_buf + _h), mods[0], c_yellow, _scale, noone, alpha, fa_middle, fa_top);
		//SLIDER
	scDrawSpriteExt(_xx, _yy + 4, sUISliderBar, 0, noone, alpha);
	var value_max = 50;
	var value = tab_map[? mods[1]] != undefined ? tab_map[? mods[1]] : 5;
	var _width = sprite_get_width(sUISliderBar);
	var _scale_btn = 1;
	if (scUIHoveringBox(_xx, _yy, _xx + _width, _yy + 8, tab_buf, tab_buf)) {
		if (mouse_check_button(mb_left)) { //Drag value
			var xmiddle = _xx + (_width / 2);
			tab_map[? mods[1]] = ((device_mouse_x_to_gui(0) - xmiddle) / _width) * (value_max * 2);
			tab_map[? mods[1]] = clamp(floor(tab_map[? mods[1]]), -value_max, value_max)
			value = tab_map[? mods[1]];
		}
		_scale_btn *= 1.2;
	}
		//BUTTON
	var offset = (_width / (value_max * 2)) * value;
	scDrawSpriteExt(_xx + (_width / 2) + offset, _yy + 4, sUISliderButton, 0, noone, alpha, _scale_btn, _scale_btn);
		//VALUE
	_yy += tab_buf;
	scDrawText(_xx - tab_buf + (_w / 2), _yy, string(value), c_red, _scale, noone, alpha, fa_middle, fa_top);

	_xx -= tab_buf;
	_yy += tab_buf * 2;

	var _text = ["Apply", "Reset"];
		//APPLY
			//BUTTON
	var _text_len = string_width(_text[0]) * _scale;
	scDrawRectRound(_xx + (_w / 2) - (tab_buf * 2) - _text_len, _yy - tab_buf / 2, _xx + (_w / 2) - tab_buf, _yy + _h + tab_buf / 2, c_gray, false, alpha, 8, 8); //Button

	if (scUIHoveringBox(_xx + (_w / 2) - (tab_buf * 2) - _text_len, _yy, _xx + (_w / 2) - tab_buf, _yy + _h , tab_buf, tab_buf)) {
		if (mouse_check_button_pressed(mb_left)) { //Drag value
			var _map = tab_map;
			if (_map[? "players"] != noone) {
				var _ps = _map[? "players"];
				for (var i = 0; i < array_length_1d(_ps); i++)
					with (_ps[i])
						gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] += value;
			}
		}
		_scale *= 1.2;
	}
			//TEXT
	scDrawText(_xx + (_w / 2) - tab_buf * 1.5 - (_text_len / 2), _yy + (_h / 2), _text[0], c_white, _scale, noone, alpha, fa_middle, fa_middle);
	_scale = _scale_o;

			//RESET
	_text_len = string_width(_text[1]) * _scale;
	scDrawRectRound(_xx + (_w / 2) + tab_buf, _yy - tab_buf / 2, _xx + (_w / 2) + (tab_buf * 2) + _text_len, _yy + _h + tab_buf / 2, c_gray, false, alpha, 8, 8); //Button

	if (scUIHoveringBox(_xx + (_w / 2) + tab_buf, _yy, _xx + (_w / 2) + (tab_buf * 2) + _text_len, _yy + _h , tab_buf, tab_buf)) {
		if (mouse_check_button_pressed(mb_left)) //Drag value
			tab_map[? mods[1]] = mods[2];
		_scale *= 1.2;
	}
			//TEXT
	scDrawText(_xx + (_w / 2) + tab_buf * 1.5 + (_text_len / 2), _yy + (_h / 2), _text[1], c_white, _scale, noone, alpha, fa_middle, fa_middle);
	_scale = _scale_o;
	_yy += _h + tab_buf * 2;
	_xx += tab_buf;
}