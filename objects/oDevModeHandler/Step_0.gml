/// @desc Change characters

var _b = 32;
if (mouse_check_button_pressed(mb_right)) {
	with (oPlayer) //Change Char
		if (mouse_x > bbox_left - _b && mouse_x < bbox_right + _b)
			if (mouse_y > bbox_top - _b && mouse_y < bbox_bottom + _b) {
				var _info = player_map[? PLAYER_MAP.CHARACTER_INFO];
				var _char = _info[? CHARACTER_MAP.TYPE] + 1;
				if (_char >= CHARACTER.LENGTH)	
					_char = 0;
				scPlayerCharacterChange(_char, false);
			}
	with (oEnemy) //Change Char
		if (mouse_x > bbox_left - _b && mouse_x < bbox_right + _b)
			if (mouse_y > bbox_top - _b && mouse_y < bbox_bottom + _b) {
				var _info = player_map[? PLAYER_MAP.CHARACTER_INFO];
				var _char = _info[? CHARACTER_MAP.TYPE] + 1;
				if (_char >= CHARACTER_ENEMY.LENGTH)	
					_char = 0;
				scEnemyCharacterChange(_char);
			}
}

//LEFT CLICK = Toggle AI mode
//LEFT CLICK + CONTROL = Gain enemy control

/*if (mouse_check_button_pressed(mb_left)) //Gain Enemy Control
	with (pEntity)
		if (mouse_x > bbox_left - _b && mouse_x < bbox_right + _b)
			if (mouse_y > bbox_top - _b && mouse_y < bbox_bottom + _b) {
				if (scGetParent(oEnemy, id)) {
					if (keyboard_check(vk_control)) {
						if (keys == KEYBIND.NONE)
							keys = KEYBIND.PLAYER2;
						else
							keys = KEYBIND.NONE;
						scKeybindsSet(keys);
					} else
						system_ai = !system_ai;
				} else {
					if (aiBrain != noone)
						system_ai = !system_ai;
				}
			}*/
		

if (keyboard_check(vk_control)) {
	with (oPlayer) //Move Player
		if (mouse_x > bbox_left - _b && mouse_x < bbox_right + _b)
			if (mouse_y > bbox_top - _b && mouse_y < bbox_bottom + _b) {
				x = mouse_x;
				y = mouse_y;
				gravity_map[? GRAVITY_MAP.VSP_MOVE] = 0;
			}
}