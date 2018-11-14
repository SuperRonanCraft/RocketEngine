if (!global.pause) exit;

key_up = keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(vk_down);
key_enter = keyboard_check_pressed(vk_enter);

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
				ds_grid[# 3, menu_option[page]] += hinput * 0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
			break;
		case menu_element_type.toggle:
			var hinput = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
			if (hinput != 0) {
				//AUDIO
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
			break;
		case menu_element_type.input:
			var key = keyboard_lastkey;
			if (key != vk_enter && key != ds_grid[# 3, menu_option[page]]) {
				//AUDIO
				ds_grid[# 3, menu_option[page]] = key;
				variable_global_set(ds_grid[# 2, menu_option[page]], key);
				for (var i = 0; i < instance_number(oPlayer); i ++)
					with (instance_find(oPlayer, i))
						scKeybindsSet(playerid);
			}
			break;
	}
} else {
	var ochange = key_down - key_up;
	if (ochange != 0) {
		menu_option[page] += ochange;
		if (menu_option[page] > ds_height - 1)
			menu_option[page] = 0;
		else if (menu_option[page] < 0)
			menu_option[page] = ds_height - 1;
		audio_play_sound(SOUND.UI_HOVER, 5, false);
	}
}

if (key_enter) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: if (inputting) script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	audio_play_sound(SOUND.UI_SELECT, 5, false);
}