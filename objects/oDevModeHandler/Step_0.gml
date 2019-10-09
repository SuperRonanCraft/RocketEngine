/// @desc Change characters

var _b = 32;
if (mouse_check_button_pressed(mb_right))
	with (oPlayer) //Change Char
		if (mouse_x > bbox_left - _b && mouse_x < bbox_right + _b)
			if (mouse_y > bbox_top - _b && mouse_y < bbox_bottom + _b) {
				var _info = player_map[? PLAYER_MAP.CHARACTER_INFO];
				var _char = _info[? CHARACTER_MAP.TYPE] + 1;
				if (_char >= CHARACTERS.LENGTH)	
					_char = 0;
				scPlayerCharacterChange(_char, false);
			}

if (mouse_check_button_pressed(mb_left)) //Gain Enemy Control
	with (oEnemy)
		if (mouse_x > bbox_left - _b && mouse_x < bbox_right + _b)
			if (mouse_y > bbox_top - _b && mouse_y < bbox_bottom + _b) {
				if (keys == KEYBIND.NONE)
					keys = KEYBIND.PLAYER2;
				else
					keys = KEYBIND.NONE;
				scKeybindsSet(keys);
			}

if (keyboard_check(vk_control)) {
	with (oPlayer) //Move Player
		if (mouse_x > bbox_left - _b && mouse_x < bbox_right + _b)
			if (mouse_y > bbox_top - _b && mouse_y < bbox_bottom + _b) {
				x = mouse_x;
				y = mouse_y;
				gravity_map[? GRAVITY_MAP.VSP_MOVE] = 0;
			}
}