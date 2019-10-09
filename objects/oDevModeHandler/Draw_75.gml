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