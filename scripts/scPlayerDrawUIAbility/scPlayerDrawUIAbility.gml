//Draw Player Ability
///@arg x
///@arg y
///@arg size-in-pixels
///@arg buffer
///@arg alpha

if (!system_ability) exit;
var map = ability_map;
if (map[? ABILITY_MAP.TYPE] == ABILITY_TYPE.NONE) exit;

var _x = argument0;
var _y = argument1;
var _width = argument2;
var _buffer = argument3;
var _alpha = argument4;
var _time_max = map[? ABILITY_MAP.COOLDOWN] * room_speed;
var _time = map[? ABILITY_MAP.CURRENT_TIME];

_x = team == TEAM.LEFT ? _x : RES_W - _x - _width;

var _size = _width + (_buffer * 2);

//scDrawRect(_x, _y, _x + _size, _y + _size, c_gray, false, _alpha); //background
scDrawNineSplice(sUIBox, _x - 8, _y - 8, _x + _size, _y + _size, _alpha, _alpha);
if (map[? ABILITY_MAP.SPRITE] != noone)
	scDrawSpriteExt(_x + _buffer, _y + _buffer, map[? ABILITY_MAP.SPRITE], 0, noone, _alpha, 0.5, 0.5);

if (_time > 0) { //Still in cooldown
	var _per = _time / _time_max;
	scDrawRect(_x, _y + (_size - (_size * _per)), _x + _size, _y + _size, c_yellow, false, _alpha);
	scDrawText(_x + _size, _y + _size + 8, ceil(_time / room_speed), c_white, 0.5, noone, _alpha, fa_middle, fa_middle);
} else { //ready to throw ability
	var gamepad = !controller_lastused ? GAMEPAD_TYPE.KEYBOARD : GAMEPAD_TYPE.PS4;
	var scale = 1;
	var c = c_white;
	_y += _size + 8;
	_x += _size / 2;
	if (gamepad == GAMEPAD_TYPE.KEYBOARD) { //No Gamepad
		scale = 0.5;
		//_y += string_height(scKeyToString(key_map[? KEYBIND_MAP.ABILITY])) * scale;
		c = c_yellow;
	}
	scUIGamepadDraw(gamepad, !controller_lastused ? key_map[? KEYBIND_MAP.ABILITY] : key_map[? KEYBIND_MAP.ABILITY_GP], _x, _y, c, scale, 1);		
}