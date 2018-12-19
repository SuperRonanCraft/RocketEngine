if (!control) exit; //Set when we move to another room
else scUIReloadGlobal(); //Reload global vars

var key_up = keyboard_check_pressed(vk_up), key_down = keyboard_check_pressed(vk_down);
var key_enter = keyboard_check_released(vk_enter), key_enter_mouse = mouse_check_button_released(mb_left);

//Grid that we are checking based off the page we are on
var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if (inputting) { //Are we inputting data?
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
			//Audio to play for each type (MASTER, EFFECTS and MUSIC)
			/*switch (menu_option[page]) {
				case 0: if (!audio_is_playing()) audio_play_sound();
				case 1:
				case 2: 
			}*/
			var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
			if (hinput != 0) {
				var val = ds_grid[# 4, menu_option[page]] + hinput * 0.01;
				ds_grid[# 4, menu_option[page]] = clamp(val, 0, 1);
				break;
			} else if ((device_mouse_x_to_gui(0) != mouse_x_old || device_mouse_y_to_gui(0) != mouse_y_old) 
					&& mouse_check_button(mb_right)) { //Must be pressing right to move slider
				mouse_x_old = device_mouse_x_to_gui(0);
				mouse_y_old = device_mouse_y_to_gui(0);
				var xleft = start_x[menu_option[page]] + (x_buffer * 2);
				var ycheck = start_y[menu_option[page]];
				if (mouse_x_old > xleft - 10 && mouse_x_old < xleft + slider_width + 10 && mouse_y_old > ycheck - 10 && mouse_y_old < ycheck + 10) {
					var val = (mouse_x_old - xleft) / slider_width;
					ds_grid[# 4, menu_option[page]] = clamp(val, 0, 1);
				}
			}
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
			if (key == noone /*No key*/ || key == 13 /*Enter key*/) break; //Invalid key, break out
			if (key != variable_global_get(ds_grid[# 2, menu_option[page]])) {
				//AUDIO
				variable_global_set(ds_grid[# 2, menu_option[page]], key);
				keys_update = true; //Update the keybinds when unpaused (only works in pause screen)
			}
			break;
	}
} else { //Not inputting
	//Keyboard support
	var ochange = key_down - key_up;
	if (ochange != 0) {
		var newoption = menu_option[page] + ochange;
		if (newoption > ds_height - 1) newoption = 0;
		else if (newoption < 0) newoption = ds_height - 1;
		//Ignore special menu elements
		for (var i = 0; i < array_length_1d(menu_special); i++)
			if (ds_grid[# 1, newoption] == menu_special[i]) { //Ignore this element, change the option
				if (ochange < 0) newoption = ds_height - 1;
				else newoption += 1;
				break;
			}
		if (newoption != menu_option[page] ) { //Not on the same selection
			menu_option[page] = newoption;
			audio_play_sound(SOUND.UI_HOVER, 5, false);
		}
	}
	//Mouse Support
	else if (!unfolding && (device_mouse_x_to_gui(0) != mouse_x_old || device_mouse_y_to_gui(0) != mouse_y_old)) { //Not unfolding and mouse is moving
		mouse_x_old = device_mouse_x_to_gui(0);
		mouse_y_old = device_mouse_y_to_gui(0);
		var newoption = -1; //-1 means no option
		if (page_workingon == page) //Make sure we are working on the current page
			for (var i = 0; i < ds_grid_height(ds_grid); i++) {
				var yoffset = (y_buffer / 3), ignore = false, val = ds_grid[# 0, i], text = is_array(val) ? val[0] : val, xoffset = string_width(text) * scale_main_hovering;
				for (var a = 0; a < array_length_1d(menu_special); a++)
					if (ds_grid[# 1, i] == menu_special[a]) {
						ignore = true; break; //Ignore this element
					}
				if (!ignore && mouse_y_old > start_y[i] - yoffset && mouse_y_old < start_y[i] + yoffset) //Y-Check
					if (mouse_x_old > (centered ? start_x[i] - (xoffset / 2) : start_x[i] - xoffset - (x_buffer / 2)) //X-Check
						&& mouse_x_old < (centered ? start_x[i] + (xoffset / 2) : start_x[i])) {
						newoption = i; break;} //Set the new option, break away
			}
		if (newoption != menu_option[page]) { //Not on the same selection
			menu_option[page] = newoption;
			if (newoption != -1) audio_play_sound(SOUND.UI_HOVER, 5, false);
		}
	}
}

//If Enter or Left-Clicking and we have a selection, execute the action
if ((key_enter || key_enter_mouse) && menu_option[page] != -1) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.script_runner: //Run a script when selecting
			script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_element_type.goto_room: //Change the room, dont care what happens to object
			SlideTransition(TRANS_MODE.GOTO, ds_grid[# 2, menu_option[page]]); control = false; break; //Remove control and leave the room
		case menu_element_type.page_transfer: //Change the page
			for (var i = 0; i < array_length_1d(menu_pages_index); i++) {
				if (menu_pages_index[i] != ds_grid[# 2, menu_option[page]]) continue; 
				page = i; if (key_enter_mouse) menu_option[page] = -1; break;} //Set new page selection to -1 if mouse Was used to enter
			break;
		//Input elements
		case menu_element_type.slider: //If its a slider and confirming
		case menu_element_type.shift: //If we are shifting from and confirmed
		case menu_element_type.toggle: //If we were toggling data and confirmed
			if (inputting) { script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 4, menu_option[page]]);
				variable_global_set(ds_grid[# 3, menu_option[page]], ds_grid[# 4, menu_option[page]]); }
		case menu_element_type.input: //Simply inputting a character
			inputting = !inputting; break;
	}
	audio_play_sound(SOUND.UI_SELECT, 5, false); //Confirm sound
}