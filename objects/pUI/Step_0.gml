if (!control)
	exit;

var key_up = keyboard_check_pressed(vk_up);
var key_down = keyboard_check_pressed(vk_down);
var key_enter = keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left);

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if (inputting) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.shift:
			var hinput = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
			if (hinput != 0) {
				//AUDIO
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]]) - 1);
			}
			break;
		case menu_element_type.slider:
			/*switch (menu_option[page]) {
				case 0: if (!audio_is_playing()) audio_play_sound();
				case 1:
				case 2: 
			}*/
			var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
			if (hinput != 0) {
				var val = ds_grid[# 4, menu_option[page]] + hinput * 0.01;
				ds_grid[# 4, menu_option[page]] = clamp(val, 0, 1);
			}
			break;
		case menu_element_type.toggle:
			var hinput = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
			if (hinput != 0) {
				//AUDIO
				var val = ds_grid[# 4, menu_option[page]] + hinput;
				ds_grid[# 4, menu_option[page]] = clamp(val, 0, 1);
			}
			break;
		case menu_element_type.input:
			var key = keyboard_lastkey;
			if (key != vk_enter && key != variable_global_get(ds_grid[# 2, menu_option[page]])) {
				//AUDIO
				variable_global_set(ds_grid[# 2, menu_option[page]], key);
				for (var i = 0; i < instance_number(oPlayer); i ++)
					with (instance_find(oPlayer, i))
						scKeybindsSet(playerid);
			}
			break;
	}
} else {
	//Reload global vars
	if (!checked) {
		for (var a = 0; a < array_length_1d(menu_pages); a++)
			var ds_g_main = menu_pages[a];
			for (var i = 0; i < array_length_1d(ds_g_main); i++) {
				var ds_g = menu_pages[# a, i];
				switch (ds_g[# 1, i]) {
					case menu_element_type.slider:
					case menu_element_type.toggle: ds_g[# 4, i] = variable_global_get(ds_g[# 3, i]); break;
					case menu_element_type.input: ds_g[# 3, i] = variable_global_get(ds_g[# 2, i]); break;
				}
			}
		checked = true;
	}
	//Key controls
	var ochange = key_down - key_up;
	if (ochange != 0) {
		mouse_moving = false;
		menu_option[page] += ochange;
		if (menu_option[page] > ds_height - 1)
			menu_option[page] = 0;
		else if (menu_option[page] < 0)
			menu_option[page] = ds_height - 1;
		audio_play_sound(SOUND.UI_HOVER, 5, false);
	} else if (device_mouse_x_to_gui(0) != mouse_x_old || device_mouse_y_to_gui(0) != mouse_y_old) {
		mouse_x_old = device_mouse_x_to_gui(0);
		mouse_y_old = device_mouse_y_to_gui(0);
		mouse_moving = true;
	}
	//Mouse support
	if (mouse_moving) {
		var centered = false;
		var old_menu_option = menu_option[page];
		for (var i = 0; i < array_length_1d(menu_pages_centered); i++)
		if (menu_pages[page] == menu_pages_centered[i])
			centered = true;
		var set = false;
		for (var i = 0; i < ds_grid_height(menu_pages[page]); i++) {
			var yoffset = (y_buffer / 3);
			var ycheck = i * y_buffer;
			if (mouse_y_old > start_y + ycheck - yoffset && mouse_y_old < start_y + ycheck + yoffset) {
				menu_option[page] = i;
				set = true;
			}
		}
		if (!set)
			menu_option[page] = -1;
		else if (old_menu_option != menu_option[page])
			audio_play_sound(SOUND.UI_HOVER, 5, false);
	}
}

//If Enter or Left-Clicking (both are set as enter) and we have a selection, execute the action
if (key_enter && menu_option[page] != -1) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_element_type.goto_room: SlideTransition(TRANS_MODE.GOTO, ds_grid[# 2, menu_option[page]]); control = false; break;
		case menu_element_type.page_transfer: 
			for (var i = 0; i < array_length_1d(menu_pages_index); i++)
				if (menu_pages_index[i] == ds_grid[# 2, menu_option[page]]) {
					menu_option[page] = -1;
					page = i;
					break;
				}
			break;
		case menu_element_type.slider:
		case menu_element_type.shift:
		case menu_element_type.toggle: if (inputting) {
			script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 4, menu_option[page]]);
			variable_global_set(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]);}
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	audio_play_sound(SOUND.UI_SELECT, 5, false);
}