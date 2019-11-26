//Draw Player Ability
///@arg x
///@arg y
///@arg size-in-pixels
///@arg alpha

if (!system_ability) exit;
var map = ability_map;
if (map[? ABILITY_MAP.TYPE] == ABILITY_TYPE.NONE) exit;

var _x = argument0;
var _y = argument1;
var _size = argument2;
var _alpha = argument3;
var _time_max = map[? ABILITY_MAP.COOLDOWN] * room_speed;
var _time = map[? ABILITY_MAP.CURRENT_TIME];

//scDrawRect(_x - _size, _y + _size * 2, _x + _size, _y, c_gray, false, _alpha);

scDrawRect(_x, _y, _x + _size, _y + _size, c_gray, false, _alpha);
if (ceil(_time / room_speed) > 0) {
	var _per = _time / _time_max;
	scDrawRect(_x, _y + (_size - (_size * _per)), _x + _size, _y + _size, c_dkgray, false, _alpha);
	scDrawText(_x + _size, _y + _size, ceil(_time / room_speed), c_white, 0.5, noone, _alpha, fa_middle, fa_middle);
}