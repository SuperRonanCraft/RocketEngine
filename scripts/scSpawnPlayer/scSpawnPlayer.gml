///@arg x
///@arg y
///@arg keybinds
///@arg load-character
///@arg character*
///@arg team*
///@arg ai-enabled*

var xx = argument[0];
var yy = argument[1];
var _keys = argument[2];
var _load = argument[3];
var _char = argument_count > 4 ? (argument[4] != noone ? argument[4] : noone) : noone;
var _team = argument_count > 5 ? (argument[5] != noone ? argument[5] : TEAM.NONE) : TEAM.NONE;
var _ai = argument_count > 6 ? (argument[6] != noone ? argument[6] : false) : false;

with (instance_create_depth(xx, yy, depth, oPlayer)) {
	keys = _keys;
	team = _team;
	scPlayerCharacterChange(_char, _load, false);
	scKeybindsSet(keys);
	if (_ai)
		scStartAI();
}