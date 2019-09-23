///@arg type
///@arg key
var type = argument0;
var key = argument1;

switch (type) {
	case GAMEPAD_TYPE.KEYBOARD:
		return scKeyToString(key);
		break;
	case GAMEPAD_TYPE.PS4:
		switch (key) {
			case gp_face1: return 0;
			case gp_face2: return 1;
			case gp_face3: return 2;
			case gp_face4: return 3;
			case gp_shoulderl: return 4;
			case gp_shoulderlb: return 6;
			case gp_shoulderr: return 5;
			case gp_shoulderrb: return 7;
			case gp_axisrv: return 17;
			case gp_axisrh: return 17;
			case gp_axislv: return 16;
			case gp_axislh: return 16;
			case gp_padu: return 35;
			case gp_padr: return 34;
			case gp_padd: return 36;
			case gp_padl: return 33;
			default:
				return 8;
		}
	case GAMEPAD_TYPE.XBOX:
		switch (key) {
			case gp_face1: return 160;
			case gp_face2: return 161;
			case gp_face3: return 162;
			case gp_face4: return 163;
			case gp_shoulderl: return 166;
			case gp_shoulderlb: return 164;
			case gp_shoulderr: return 167;
			case gp_shoulderrb: return 165;
			case gp_axisrv: return 177;
			case gp_axisrh: return 177;
			case gp_axislv: return 176;
			case gp_axislh: return 176;
			case gp_padu: return 35;
			case gp_padr: return 34;
			case gp_padd: return 36;
			case gp_padl: return 33;
			default:
				return 8;
		}
}

enum GAMEPAD_TYPE {
	KEYBOARD, PS4, XBOX, OTHER
}