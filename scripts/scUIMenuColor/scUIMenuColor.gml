/// @arg color-id
var c = argument0;
var newc;

switch (c) {
	case 0:
		newc = c_orange;
		break;
	case 1:
		newc = c_red;
		break;
	case 2:
		newc = c_lime;
		break;
	case 3:
		newc = c_blue;
		break;
	case 4:
		newc = c_fuchsia;
		break;
	case 5:
		newc = c_white;
		break;
	default:
		newc = c_orange;
		break;
}

global.menu_color_hover_act = newc;
color_main_hovering = newc;