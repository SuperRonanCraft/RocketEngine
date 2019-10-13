/// @desc Draw Keys
var _yy = tab_y;

var _types = [["Settings", 0], ["Buffs", 1], ["Weapons", 2], ["Movement", 3], ["Info", 4]];

if (tab_open) { //Maximized
	for (var i = 0; i < array_length_1d(_types); i++) {
		var _scale = 0.4;
		var _len = 0;
		var _array = _types[i];
		var _text = _array[0];
		_len = string_width(_text) * _scale;
		var _offset = 0;
		var _alpha = alpha;
		var _c = tab_color;
		if (scUIHoveringBox(0, _yy, tab_w, _yy + _len, tab_buf * 2, tab_buf * 2)) {
			if (mouse_check_button_pressed(mb_left)) {
				if (tab != i)
					tab = i;
				 else
					tab = -1;
			}
			_alpha = 1;
			_offset = tab_buf / 2;
			_c = tab_color_hover;
		} else if (tab == i)
			_offset = tab_buf / 2;
		if (tab != i) { //Not Selected
			scDrawRectRound(0, _yy - _offset - tab_buf, tab_w + _offset, _yy + _len + tab_buf + _offset, _c, false, _alpha, 8, 8);
		} else {
			_alpha = 1;
			scDrawRectRound(0, _yy - _offset - tab_buf, tab_w + _offset, _yy + _len + tab_buf + _offset, tab_color_select, false, _alpha, 8, 8);
			event_user(_array[1]);
		}
		scDrawText(tab_w / 2, _yy + (_len / 2), _text, c_black, _scale, c_ltgray, _alpha, fa_middle, fa_middle, 90);
		_yy += _len + (tab_buf * 4);
	}
}
//Toggle Btn
_yy = tab_y - tab_buf * 4;
var _alpha = alpha;
if (scUIHoveringBox(0, _yy, tab_w, _yy + (tab_buf * 2), tab_buf * 2, 0)) {
	if (mouse_check_button_pressed(mb_left))
		tab_open = !tab_open;
	_alpha = 1;
}
scDrawRectRound(0, _yy, tab_w, _yy + (tab_buf * 2), tab_open ? c_green : c_red, false, max(_alpha, 0.5), 8, 8);