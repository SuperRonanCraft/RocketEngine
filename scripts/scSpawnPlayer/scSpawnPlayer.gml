///@arg x
///@arg y
///@arg keybinds
///@arg load-character
///@arg character*

var xx = argument[0];
var yy = argument[1];
var _keys = argument[2];
var _load = argument[3];
var _char = argument_count > 4 ? (argument[4] != noone ? argument[4] : noone) : noone;

with (instance_create_depth(xx, yy, depth, oPlayer)) {
	keys = _keys;
	scPlayerCharacterChange(_char, _load, false);
}