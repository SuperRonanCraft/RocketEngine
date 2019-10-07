/// @desc 

// Inherit the parent event
event_inherited();

if (mouse_x > bbox_left && mouse_x < bbox_right)
	if (mouse_y > bbox_top && mouse_y < bbox_bottom) 
		if (mouse_check_button_pressed(mb_left)) {
			if (keys == KEYBIND.NONE)
				keys = KEYBIND.PLAYER1;
			else
				keys = KEYBIND.NONE;
			scKeybindsSet(keys);
		}