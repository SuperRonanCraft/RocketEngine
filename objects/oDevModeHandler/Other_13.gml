/// @desc Miscellaneous

var _xx = tab_w + (tab_buf * 2);
var _yy = tab_y - tab_buf - (tab_buf / 2);

var _mods = [["HSP MOVE MOD", "misc_hspmovemod", 5, 250, 5, "SLIDER"],
			["VSP", "misc_vsp", -5, 250, 5, "SLIDER"], 
			["DAMAGE", "misc_damage", 10, 200, 5, "SLIDER"],
			["KEYBIND", "misc_keybind", KEYBIND_PLAYER.PLAYER1, KEYBIND_PLAYER.NONE, KEYBIND_PLAYER.NONE, "SLIDER"],
			["AI", "misc_ai", noone, noone, noone, "TOGGLE"],
			["GRAVITY", "misc_grv", noone, noone, noone, "TOGGLE"]];
var _w = sprite_get_width(sUISliderBar) + (tab_buf * 2);
var _scale_o = 0.4
var _scale = _scale_o;
var _h = string_height("HSP") * _scale;
var _height = ((tab_buf * 4) + (_h * 3)) * array_length(_mods);
var desc = tab_map[? "players"] == noone ? "Select a Player!" : noone;
var desc_h = desc != noone ? string_height(desc) * 0.4 : 0;
scDrawRectRound(_xx - tab_buf, _yy, _xx + _w + tab_buf, _yy + _height + desc_h, tab_color_select, false, alpha, 8, 8);
if (desc != noone)
	scDrawText(_xx + (_w / 2), _yy + _height, desc, c_fuchsia, 0.4, noone, alpha, fa_middle, fa_top);
_xx += tab_buf;

//HSP MOD
_yy += tab_buf;
for (var i = 0; i < array_length(_mods); i++) {
	_yy += tab_buf + _h;
	var mods = _mods[i];
	scDrawText(_xx + (_w / 2) - tab_buf, _yy - (tab_buf + _h), mods[0], c_yellow, _scale, noone, alpha, fa_middle, fa_top);
	switch (mods[5]) {
		case "SLIDER": //SLIDER
			scDrawSpriteExt(_xx, _yy + 4, sUISliderBar, 0, noone, alpha);
			var value_max = mods[3];
			var value_min = mods[2];
			var value = tab_map[? mods[1]] != undefined ? tab_map[? mods[1]] : mods[4];
			var _width = sprite_get_width(sUISliderBar);
			var _scale_btn = 1;
			if (scUIHoveringBox(_xx, _yy, _xx + _width, _yy + 8, tab_buf * 4, tab_buf * 1.4)) {
				if (mouse_check_button(mb_left)) { //Drag value
					tab_map[? mods[1]] = ((device_mouse_x_to_gui(0) - _xx) / _width) * (value_max - value_min);
					tab_map[? mods[1]] = clamp(floor(tab_map[? mods[1]]), value_min, value_max)
					value = tab_map[? mods[1]];
				}
				_scale_btn *= 1.2;
			}
				//BUTTON
			var offset = (_width / (value_max - value_min)) * value;
			scDrawSpriteExt(_xx + offset, _yy + 4, sUISliderButton, 0, noone, alpha, _scale_btn, _scale_btn);
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
						for (var a = 0; a < array_length(_ps); a++)
							with (_ps[a])
								switch (mods[1]) {
									case "misc_hspmovemod":
										gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] += value; break;
									case "misc_vsp":
										gravity_map[? GRAVITY_MAP.VSP_MOVE] += value; break;
									case "misc_damage":
										scShootableDamage(id, id, false, false, value, false); break;
									case "misc_keybind":
										scKeybindsSet(value); break;
								}
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
					tab_map[? mods[1]] = mods[4];
				_scale *= 1.2;
			}
					//TEXT
			scDrawText(_xx + (_w / 2) + tab_buf * 1.5 + (_text_len / 2), _yy + (_h / 2), _text[1], c_white, _scale, noone, alpha, fa_middle, fa_middle);
			break;
		case "TOGGLE":
			//BUTTON
			var _text = ["TOGGLE"];
			var _text_len = string_width(_text[0]) * _scale;
			scDrawRectRound(_xx + (_w / 2) - (tab_buf * 2) - _text_len, _yy - tab_buf / 2, _xx + (_w / 2) - tab_buf, _yy + _h + tab_buf / 2, c_gray, false, alpha, 8, 8); //Button
			
			if (scUIHoveringBox(_xx + (_w / 2) - (tab_buf * 2) - _text_len, _yy, _xx + (_w / 2) - tab_buf, _yy + _h , tab_buf, tab_buf)) {
				if (mouse_check_button_pressed(mb_left)) {
					var _map = tab_map;
					if (_map[? "players"] != noone) {
						var _ps = _map[? "players"];
						for (var a = 0; a < array_length(_ps); a++)
							with (_ps[a])
								switch (mods[1]) {
									case "misc_ai":
										if (aiBrain == noone) {
											scStartAI();
											system_ai = true;
										} else
											system_ai = !system_ai;
										break;
									case "misc_grv":
										gravity_map[? GRAVITY_MAP.GRAVITY_ENABLED] = !gravity_map[? GRAVITY_MAP.GRAVITY_ENABLED];
										break;
								}
					}
				}
				_scale *= 1.2;
			}
					//TEXT
			scDrawText(_xx + (_w / 2) - tab_buf * 1.5 - (_text_len / 2), _yy + (_h / 2), _text[0], c_white, _scale, noone, alpha, fa_middle, fa_middle);
			break;
	}
	_scale = _scale_o;
	_yy += _h + tab_buf * 2;
	_xx += tab_buf;
}