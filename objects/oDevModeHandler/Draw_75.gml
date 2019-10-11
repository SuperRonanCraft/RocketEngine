/// @desc Draw Keys
var _yy = tab_y;
for (var i = 0; i < 4; i++) {
	var _scale = 0.4;
	var _len = 0;
	var _text = "TEST";
	switch (i) { //Name of Tab
		case 0:
			_text = "Info"; break;
		case 1:
			_text = "Buffs"; break;
		case 2:
			_text = "Weapons"; break;
		case 3:
			_text = "Movement"; break;
	}
	_len = string_width(_text) * _scale;
	var _offset = 0;
	var _alpha = alpha;
	if (scUIHoveringBox(0, _yy, tab_w, _yy + _len, tab_buf * 2, tab_buf * 2)) {
		if (mouse_check_button_pressed(mb_left)) {
			if (tab != i)
				tab = i;
			 else
				tab = -1;
		}
		_alpha = 1;
		_offset = tab_buf / 2;
	} else if (tab == i)
		_offset = tab_buf / 2;
	if (tab != i) { //Not Selected
		scDrawRectRound(0, _yy - _offset - tab_buf, tab_w + _offset, _yy + _len + tab_buf + _offset, c_white, false, _alpha, 8, 8);
	} else {
		scDrawRectRound(0, _yy - _offset - tab_buf, tab_w + _offset, _yy + _len + tab_buf + _offset, c_white, false, 1, 8, 8);
		switch (i) {
			case 0: //INFO
				event_user(6);
				break;
			case 1: //BUFFS
				event_user(0);
				break;
			case 2: //WEAPONS
				event_user(2);
				break;
			case 3: //MOVEMENT
				event_user(4);
				break;
		}
	}
	scDrawText(tab_w / 2, _yy + (_len / 2), _text, c_black, _scale, c_ltgray, 1, fa_middle, fa_middle, 90);
	_yy += _len + (tab_buf * 4);
}