//DRAW ULTIMATE
///@arg x
///@arg y
///@arg length
///@arg hei
///@arg alpha

if (!system_ultimate) exit;

var _x = argument0;
var _y = argument1;
var _len = argument2;
var _hei = argument3;
var _alpha = argument4;
var _side = team == TEAM.LEFT ? 1 : -1;
_x = team == TEAM.LEFT ? _x : RES_W - _x;
var map = ultimate_map;
	
//ULTIMATE CHARGE CIRCLE
if (!map[? ULTIMATE_CASTING_MAP.ENABLED]) exit;

var _charge = map[? ULTIMATE_CASTING_MAP.CHARGE] / map[? ULTIMATE_CASTING_MAP.CHARGE_MAX];
scDrawSpriteExt(_x, _y, sUIUltimate, 0, noone, _alpha, _len * _charge * _side); //Charge

var _x2 = _x + ((_len * _charge) * _side);
scDrawRect(_x2, _y, _x + (_len * _side), _y + _hei, c_dkgray, false, _alpha); //Background

var c = _charge >= 1 ? c_green : c_yellow;
//Frame
scDrawSpriteExt(_x, _y, sUIHealthFrame, 0, noone, _alpha, _side);

//ULTIMATE CHARGE TEXT
scDrawText(_x + (_len / 2) * _side, _y + _hei / 2, string(_charge < 1 ? floor(_charge * 100) : round(_charge * 100)) + "%", _charge < 1 ?  c_white : c_yellow,
	0.5, noone, _charge < 1 ? 0.8 : scMovementWave(0.8, 0.4, 1), fa_middle, fa_middle);

if (_charge >= 1) {
	var gamepad = !controller_lastused ? GAMEPAD_TYPE.KEYBOARD : GAMEPAD_TYPE.PS4;//scSettingsGetType(SETTINGS_TYPE.VALUE, key_map[? KEYBIND_MAP.GAMEPAD]); //Get the gamepad index
	var scale = 1;
	var ultypos = _y + _hei / 2;
	var c = c_white;
	if (gamepad == GAMEPAD_TYPE.KEYBOARD) { //No Gamepad
		scale = 0.5;
		ultypos += (string_height(scKeyToString(key_map[? KEYBIND_MAP.ULTIMATE])) * scale);
		c = c_yellow;
	}
	scUIGamepadDraw(gamepad, !controller_lastused ? key_map[? KEYBIND_MAP.ULTIMATE] : key_map[? KEYBIND_MAP.ULTIMATE_GP], _x + (_len / 2) * _side, ultypos, c, scale, 1);
	/*var str = scKeyToString(key_map[? KEYBIND_MAP.ULTIMATE]);
	scDrawText(xposcir, ypos * 2 + (string_height(str) * 0.5), str, c_yellow, 
		0.5, noone, scMovementWave(0.8, 0.4, 1));*/
}