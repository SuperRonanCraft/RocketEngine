/// @desc gamemode stage selection draw gui event

//Gamemode name
var _str = "Multiplayer";
var _scale = 2;
var _c = color_element;
scDrawText(xx, yy, _str, _c, _scale);
_c = c_yellow;

switch (menu_pages[page]) {
	case ds_menu_main:
		scDrawText(xx, yy + string_height(_str) * _scale, "Choose your name", _c, _scale / 2);
		break;
	case ds_menu_type:
		scDrawText(xx, yy + string_height(_str) * _scale, "Create or join", _c, _scale / 2);
		break;
	case ds_menu_create:
		scDrawText(xx, yy + string_height(_str) * _scale, "Choose an ip", _c, _scale / 2);
		break;
	case ds_menu_join:
		scDrawText(xx, yy + string_height(_str) * _scale, "Configure server ip", _c, _scale / 2);
		break;
}

//UI Draw event
event_inherited();