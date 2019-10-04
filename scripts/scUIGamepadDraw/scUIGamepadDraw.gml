		///@arg type
///@arg key
///@arg x
///@arg y
///@arg color*
///@arg scale*
///@arg alpha*
///@arg h_align*
///@arg y_align*
///@arg angle*

var type = argument[0];
var key = argument[1];
var xx = argument[2];
var yy = argument[3];
var c = argument_count > 4 ? (argument[4] != noone ? argument[4] : c_white) : c_white;
var scale = argument_count > 5 ? (argument[5] != noone ? argument[5] : 1) : 1;
var alpha = argument_count > 6 ? (argument[6] != noone ? argument[6] : 1) : 1;
var h_align = argument_count > 7 ? argument[7] : noone;
var y_align = argument_count > 8 ? argument[8] : noone;
var angle = argument_count > 9 ? argument[9] : noone;
var val = scUIGamepadGet(type, scSettingsGetType(SETTINGS_TYPE.VALUE, key));

switch (type) {
	case GAMEPAD_TYPE.KEYBOARD:
		scDrawText(xx, yy, val, c, scale, noone, alpha, h_align, y_align, angle);
		//DRAW TEXT
		break;
	case GAMEPAD_TYPE.PS4:
	case GAMEPAD_TYPE.XBOX:
		scale *= val[2];
		scDrawSpriteExt(xx, yy, val[0], val[1], c, alpha, scale, scale);
		//DRAW SPRITE
		break;
}