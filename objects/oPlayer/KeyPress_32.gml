/// @desc TEST PALETTE CHANGE

var char_info = player_map[? PLAYER_MAP.CHARACTER_INFO];
var index = char_info[? CHARACTER_MAP.PALETTE_INDEX] + 1;
if (index >= sprite_get_width(char_info[? CHARACTER_MAP.PALETTE]))
	index = 0;
char_info[? CHARACTER_MAP.PALETTE_INDEX] = index;