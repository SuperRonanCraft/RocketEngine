/// @desc Settings

var _xx = tab_w + (tab_buf * 2);
var _yy = tab_y - tab_buf - (tab_buf / 2);

//Name, Value_Name, Value, [Min, Max]
var _mods = [["Alpha", "SLIDER", alpha, "alpha", [0.1, 1]], ["Deselect All", "EDIT_MAP", "tab_map", "players", noone, "Players"]];
var _w = sprite_get_width(sUISliderBar) + (tab_buf * 2);
var _scale_o = 0.4
var _scale = _scale_o;
var _h = string_height("HSP") * _scale;
var _height = ((tab_buf * 4) + (_h * 3)) * array_length_1d(_mods);
scDrawRectRound(_xx - tab_buf, _yy, _xx + _w + tab_buf, _yy + _height, tab_color_select, false, alpha, 8, 8);
_xx += tab_buf;
_yy += tab_buf;
for (var i = 0; i < array_length_1d(_mods); i++) {
	var mods = _mods[i];
	if (i != 0) {
		_yy += tab_buf + _h;
		scDrawLine(_xx - tab_buf, _yy, _xx + _w - tab_buf, _yy, c_black, 3, alpha);
		_yy += _h;
	}
	switch (mods[1]) {
		case "EDIT_MAP":
			scDrawText(_xx + (_w / 2) - tab_buf, _yy, mods[5], c_yellow, _scale, noone, alpha, fa_middle, fa_top);
			_yy += _h + tab_buf;
			_xx -= tab_buf;
			var _text = mods[0];
			var _text_len = string_width(_text) * _scale;
			scDrawRectRound(_xx + (_w / 2) - tab_buf - _text_len / 2, _yy - tab_buf / 2, _xx + (_w / 2) + tab_buf + _text_len / 2, _yy + _h + tab_buf / 2, c_gray, false, alpha, 8, 8); //Button
			
			if (scUIHoveringBox(_xx + (_w / 2) - tab_buf - _text_len / 2, _yy, _xx + (_w / 2) + tab_buf + _text_len / 2, _yy + _h, tab_buf, tab_buf)) {
				if (mouse_check_button_pressed(mb_left)) { //Apply
					var _map = variable_instance_get(id, mods[2]);
					if (_map[? mods[3]] != noone)
						_map[? mods[3]] = mods[4];
				}
				_scale *= 1.2;
			}
					//TEXT
			scDrawText(_xx + (_w / 2), _yy + (_h / 2), _text, c_white, _scale, noone, alpha, fa_middle, fa_middle);
			_scale = _scale_o;
			_xx += tab_buf;
			break;
		case "SLIDER_APPLY":
		case "SLIDER":
			scDrawText(_xx + (_w / 2) - tab_buf, _yy, mods[0], c_yellow, _scale, noone, alpha, fa_middle, fa_top);
			_yy += _h + tab_buf;
				//SLIDER
			scDrawSpriteExt(_xx, _yy + 4, sUISliderBar, 0, noone, alpha);
			var value_clamps = mods[4];
			var value = mods[2];
			var _width = sprite_get_width(sUISliderBar);
			var _scale_btn = 1;
			if (scUIHoveringBox(_xx, _yy, _xx + _width, _yy + 8, tab_buf, tab_buf)) {
				if (mouse_check_button(mb_left)) //Drag value
					tab_dragging = mods;
				_scale_btn *= 1.2;
			}
			if (tab_dragging == mods) {
				var xleft = _xx;
				mods[2] = ((device_mouse_x_to_gui(0) - xleft) / _width);
				mods[2] = clamp(mods[2], value_clamps[0], value_clamps[1])
				value = mods[2];
				variable_instance_set(id, mods[3], value);
				if (mouse_check_button_released(mb_left)) {
					tab_dragging = noone;
					show_debug_message("RELEASING");
				}
			}
				//BUTTON
			var offset = (_width / value_clamps[1]) * value;
			scDrawSpriteExt(_xx + offset, _yy + 4, sUISliderButton, 0, noone, alpha, _scale_btn, _scale_btn);
				//VALUE
			_yy += tab_buf;
			scDrawText(_xx - tab_buf + (_w / 2), _yy, string(value), c_red, _scale, noone, alpha, fa_middle, fa_top);
			
			if (mods[1] == "SLIDER_APPLY") {
				_xx -= tab_buf;
				_yy += tab_buf * 2;
				var _text = ["Apply", "Reset"];
					//APPLY
						//BUTTON
				var _text_len = string_width(_text[0]) * _scale;
				scDrawRectRound(_xx + (_w / 2) - (tab_buf * 2) - _text_len, _yy - tab_buf / 2, _xx + (_w / 2) - tab_buf, _yy + _h + tab_buf / 2, c_gray, false, alpha, 8, 8); //Button

				if (scUIHoveringBox(_xx + (_w / 2) - (tab_buf * 2) - _text_len, _yy, _xx + (_w / 2) - tab_buf, _yy + _h , tab_buf, tab_buf)) {
					if (mouse_check_button_pressed(mb_left)) { //Apply
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
				_yy += _h + tab_buf * 2;
				_xx += tab_buf;
			}
			_scale = _scale_o;
			break;
	}
}
