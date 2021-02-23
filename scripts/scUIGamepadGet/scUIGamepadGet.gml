///@arg type
///@arg key
function scUIGamepadGet(argument0, argument1) {
	var type = argument0;
	var key = argument1;
	var val = noone;
	switch (type) {
		case GAMEPAD_TYPE.KEYBOARD:
			return scKeyToString(key);
			break;
		case GAMEPAD_TYPE.PS4:
			val[0] = sUIGamepadBtns;
			val[2] = 1;
			switch (key) {
				case gp_face1: val[1] = 8; break;
				case gp_face2: val[1] = 10; break;
				case gp_face3: val[1] = 9; break;
				case gp_face4: val[1] = 11; break;
				case gp_shoulderl: val[1] = 4; break;
				case gp_shoulderlb: val[1] = 6; break;
				case gp_shoulderr: val[1] = 5; break;
				case gp_shoulderrb: val[1] = 7; break;
				case gp_axisrv: val[0] = sUIGamepadLR; val[1] = 1; val[2] = 0.7; break;
				case gp_axisrh: val[0] = sUIGamepadLR; val[1] = 1; val[2] = 0.7; break;
				case gp_axislv: val[0] = sUIGamepadLR; val[1] = 0; val[2] = 0.7; break;
				case gp_axislh: val[0] = sUIGamepadLR; val[1] = 0; val[2] = 0.7; break;
				case gp_padu: val[1] = 1; break;
				case gp_padr: val[1] = 2; break;
				case gp_padd: val[1] = 0; break;
				case gp_padl: val[1] = 3; break;
				default: val[1] = 17; break;
			}
			return val;
		case GAMEPAD_TYPE.XBOX:
			val[0] = sUIGamepadBtns;
			val[2] = 1;
			switch (key) {
				case gp_face1: val[1] = 12; break;
				case gp_face2: val[1] = 14; break;
				case gp_face3: val[1] = 13; break;
				case gp_face4: val[1] = 15; break;
				case gp_shoulderl: val[1] = 20; break;
				case gp_shoulderlb: val[1] = 23; break;
				case gp_shoulderr: val[1] = 21; break;
				case gp_shoulderrb: val[1] = 22; break;
				case gp_axisrv: val[0] = sUIGamepadLR; val[1] = 1; val[2] = 0.7; break;
				case gp_axisrh: val[0] = sUIGamepadLR; val[1] = 1; val[2] = 0.7; break;
				case gp_axislv: val[0] = sUIGamepadLR; val[1] = 0; val[2] = 0.7; break;
				case gp_axislh: val[0] = sUIGamepadLR; val[1] = 0; val[2] = 0.7; break;
				case gp_padu: val[1] = 1; break;
				case gp_padr: val[1] = 2; break;
				case gp_padd: val[1] = 0; break;
				case gp_padl: val[1] = 3; break;
				default: val[1] = 17; break;
			}
			return val;
	}

	enum GAMEPAD_TYPE {
		KEYBOARD, PS4, XBOX, OTHER
	}


}
