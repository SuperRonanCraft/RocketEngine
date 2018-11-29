if (!control)
	exit;

if (menu_pages_index[page] == menu_page.main) {
	var btns = ds_grid_height(menu_pages[page]);
	if (unfold[btns - 1] != 1) {
		var i = 0;
		repeat (btns) {
			if (unfold[i] == 1)
				i++;
			if (i < btns)
				unfold[i] = min(1, unfold[i] + 0.025);
			if (i + 1 < btns) 
				unfold[i + 1] = min(1, unfold[i + 1] + 0.01);
		}
		unfolding = true;
	} else
		unfolding = false;
} else
	unfolding = false;

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
			//mouse_moving = false;
			if (hinput != 0) {
				var val = ds_grid[# 4, menu_option[page]] + hinput * 0.01;
				ds_grid[# 4, menu_option[page]] = clamp(val, 0, 1);
				mouse_moving = false;
				break;
			} else if (device_mouse_x_to_gui(0) != mouse_x_old || device_mouse_y_to_gui(0) != mouse_y_old) {
				mouse_x_old = device_mouse_x_to_gui(0);
				mouse_y_old = device_mouse_y_to_gui(0);
				mouse_moving = true;
			}
			//Mouse support
			if (mouse_moving && mouse_check_button(mb_right)) {
				var xleft = start_x + x_buffer;
				var ycheck = start_y + y_buffer * menu_option[page];
				if (mouse_x_old > xleft - 10 && mouse_x_old < xleft + 138 && mouse_y_old > ycheck - 10 && mouse_y_old < ycheck + 10) {
					var val = (mouse_x_old - xleft) / 128;
					ds_grid[# 4, menu_option[page]] = clamp(val, 0, 1);
					set = true;
				}
			}
			//}
			break;
		case menu_element_type.toggle:
			var hinput = keyboard_check_pressed(vk_left) - keyboard_check_pressed(vk_right);
			var val = ds_grid[# 4, menu_option[page]];
			if (hinput != 0) {
				val = clamp(val + hinput, 0, 1);
			} else if (mouse_check_button_pressed(mb_right))
				val = !val;
			if (val != ds_grid[# 4, menu_option[page]]) {
				//AUDIO
				ds_grid[# 4, menu_option[page]] = val;
			}
			break;
		case menu_element_type.input:
			var key = noone;
			if (keyboard_check_pressed(vk_anykey))
				key = keyboard_lastkey;
			if (scKeyToString(key) != -1 && key != variable_global_get(ds_grid[# 2, menu_option[page]])) {
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
		var newoption = menu_option[page] + ochange;
		if (newoption > ds_height - 1)
			newoption = 0;
		else if (newoption < 0)
			newoption = ds_height - 1;
		if (ds_grid[# 1, newoption] != menu_element_type.rocket_list && ds_grid[# 1, newoption] != menu_element_type.rocket_buffs) {
			menu_option[page] = newoption;
			audio_play_sound(SOUND.UI_HOVER, 5, false);
		}
	} else if (device_mouse_x_to_gui(0) != mouse_x_old || device_mouse_y_to_gui(0) != mouse_y_old) {
		mouse_x_old = device_mouse_x_to_gui(0);
		mouse_y_old = device_mouse_y_to_gui(0);
		mouse_moving = true;
	}
	//Mouse support
	if (mouse_moving && !unfolding) {
		var centered = false;
		var old_menu_option = menu_option[page];
		for (var i = 0; i < array_length_1d(menu_pages_centered); i++)
			if (menu_pages[page] == menu_pages_centered[i])
				centered = true;
		var set = false;
		for (var i = 0; i < ds_grid_height(ds_grid); i++) {
			var yoffset = (y_buffer / 3);
			var ycheck = i * y_buffer;
			if (ds_grid[# 1, i] != menu_element_type.rocket_list && ds_grid[# 1, i] != menu_element_type.rocket_buffs)
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