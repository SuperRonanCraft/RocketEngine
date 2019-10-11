/// @desc Draw Keys
var _textT = "DEV MODE DEBUGGING";
var _textL =
		"F3 = Hit Boxes" +
		"\nF10 = Invincible" + 
		"\nSPACE = Heal all players" +
		"\nZ = SPAWN ENEMY"
var _textR =
		"RMB + Hover = Change Characters" +
		"\nLMB + Hover (Enemy) = Gain Control" + 
		"\nControl + Hover = Move Player X/Y";

scDrawText(xx, yy - (string_height(_textT) * 0.5), _textT, c_yellow, 0.5, noone, 1, fa_middle, fa_top);
scDrawText(xx - 20, yy, _textL, c_fuchsia, 0.4, noone, 1, fa_right, fa_top);
scDrawText(xx + 20, yy, _textR, c_fuchsia, 0.4, noone, 1, fa_left, fa_top);

var _yy = tab_y;
for (var i = 0; i < 3; i++) {
	var _scale = 0.4;
	var _len = 0;
	var _text = "TEST";
	switch (i) { //Name of Tab
		case 0:
			_text = "Buffs"; break;
		case 1:
			_text = "Weapons"; break;
		case 2:
			_text = "Movement"; break;
	}
	_len = string_width(_text) * _scale;
	var _offset = 0;
	if (scUIHoveringBox(0, _yy, tab_w, _yy + _len, tab_buf * 2, tab_buf * 2)) {
		if (mouse_check_button_pressed(mb_left)) {
			if (tab != i)
				tab = i;
			 else
				tab = -1;
			ds_map_clear(tab_map);
		}
		_offset = tab_buf / 2;
	} else if (tab == i)
		_offset = tab_buf / 2;
	if (tab != i) { //Not Selected
		scDrawRectRound(0, _yy - _offset - tab_buf, tab_w + _offset, _yy + _len + tab_buf + _offset, c_white, false, 1, 8, 8);
	} else {
		scDrawRectRound(0, _yy - _offset - tab_buf, tab_w + _offset, _yy + _len + tab_buf + _offset, c_white, false, 1, 8, 8);
		switch (i) {
			case 0: //BUFFS
				tab_cur_yy = _yy;
				event_user(0);
				break;
			case 1: //WEAPONS
				tab_cur_yy = _yy;
				break;
			case 2: //MOVEMENT
				tab_cur_yy = _yy;
				break;
		}
	}
	scDrawText(tab_w / 2, _yy + (_len / 2), _text, c_black, _scale, c_ltgray, 1, fa_middle, fa_middle, 90);
	_yy += _len + (tab_buf * 4);
}