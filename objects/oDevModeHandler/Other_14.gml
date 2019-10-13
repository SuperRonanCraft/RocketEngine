/// @desc Info

var _yy = tab_y - tab_buf - (tab_buf / 2);
var _xx = tab_w + tab_buf;
var scale = 0.45;

var _textT = "DEV MODE DEBUGGING";
var _text =
		"F3 = View Hit Boxes" +
		"\nF10 = Invincible Mode" + 
		"\nSPACE = Heal all players" +
		"\nZ = Spawn Enemy" +
		"\nRMB + Hover = Change Characters" +
		"\nLMB + Hover (Enemy) = Gain Control" + 
		"\nControl + Hover = Move Player X/Y";

var len = string_width(_text) * scale;
var hei = (string_height(_textT) * scale) + (string_height(_text) * scale)

scDrawRectRound(_xx, _yy, _xx + len + tab_buf, _yy + hei + tab_buf, tab_color_select, false, alpha, 8, 8);

scDrawText(_xx + tab_buf, _yy + tab_buf, _textT, c_fuchsia, scale, noone, alpha, fa_left, fa_top); //Title
scDrawText(_xx + tab_buf, _yy + tab_buf + (string_height(_textT) * scale), _text, c_black, scale, c_ltgray, alpha, fa_left, fa_top); //Text