if (!control) exit; //Set when we move to another room
else scUIReloadGlobal(); //Reload global vars

var key_up = false, key_down = false;
var hinput = 0;
if (button_up != noone && button_down != noone && button_left != noone && button_right != noone) { //Keyboard disabled
	key_up = keyboard_check_pressed(button_up);
	key_down = keyboard_check_pressed(button_down);
	hinput = keyboard_check_pressed(button_right) - keyboard_check_pressed(button_left);
}
var key_enter = keyboard_check_released(vk_enter), key_enter_mouse = mouse_check_button_released(mb_left), enter_change = false;
var play_sound = true;

if (!key_up && !key_down && hinput == 0 && !key_enter && gamepad_is_connected(button_gamepad)) { //No keys, has a controller
	key_up = gamepad_button_check_pressed(button_gamepad, gp_padu);
	key_down = gamepad_button_check_pressed(button_gamepad, gp_padd);
	key_enter = gamepad_button_check_pressed(button_gamepad, gp_face1);
	hinput = gamepad_button_check_pressed(button_gamepad, gp_padr) - gamepad_button_check_pressed(button_gamepad, gp_padl);
}

//Grid that we are checking based off the page we are on
var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var confirm_list = ds_list_create();

for (var i = 0; i < ds_height; i++) {
	switch (ds_grid[# 1, i]) {
		case menu_element_type.mass_toggle:
		case menu_element_type.shift_script:
		case menu_element_type.shift:
			var current_id = 4, current_array_id = 2;
			if (ds_grid[# 1, i] == menu_element_type.mass_toggle) {
				current_id = 6;
				current_array_id = 3;
			}
			var val = ds_grid[# current_id, i];
			if ((hinput != 0 || key_enter) && menu_option[page] == i) {
				//AUDIO
				if (hinput != 0)
					val += hinput;
				else
					val++;
			} else if (mouse_check_button_pressed(mb_left)) { //Left button and hovering
				var len = -1;
				var current_array = ds_grid[# current_array_id, i];
				for (var d = 0; d < array_length_1d(current_array); d++)
					if (string_width(current_array[d]) * scale_element > len)
						len = string_width(current_array[d]) * scale_element;
				len += x_buffer;
				var rty = start_y[i];
				var rtx = start_x[i] + x_buffer * 2;
				if (centered) { //We are centered
					rty = start_y[i] + 25;
					rtx = start_x[i];
				} else
					rtx += (len / 2) + x_buffer;
				if (val != 0 && scUIHoveringBox(rtx - (len / 2) - x_buffer, rty - 10, rtx - (len / 2), rty + 10, 10, 10)) //Left
					val--;
				else if (i == menu_option[page] || val != array_length_1d(current_array) - 1 && scUIHoveringBox(rtx + (len / 2), rty - 10, rtx + (len / 2) + x_buffer, rty + 10, 10, 10)) //Right
					val++;
			}
			if (val != ds_grid[# current_id, i]) {
				//AUDIO
				if (val >= array_length_1d(ds_grid[# current_array_id, i]))
					val = 0;
				else if (val < 0)
					val = array_length_1d(ds_grid[# current_array_id, i]) - 1;
				ds_grid[# current_id, i] = val;
				ds_list_add(confirm_list, i);
				enter_change = true;
			}
			break;
		case menu_element_type.slider:
			var val = -1;
			if (hinput != 0 && menu_option[page] == i) { //Must be pressing btn to move slider
				if (!key_up && !key_down && hinput == 0 && !key_enter && gamepad_is_connected(button_gamepad))
					hinput = gamepad_button_check(button_gamepad, gp_padr) - gamepad_button_check(button_gamepad, gp_padl);
				val = ds_grid[# 4, i] + hinput * 0.01;
			} else if (mouse_check_button(mb_left) || mouse_check_button_released(mb_left)) {
				var xleft = start_x[i] + (x_buffer * 2);
				var ycheck = start_y[i];
				if (scUIHoveringBox(xleft, ycheck, xleft + slider_width, ycheck, x_buffer, y_buffer)) {
					if (mouse_check_button(mb_left))
						val = (device_mouse_x_to_gui(0) - xleft) / slider_width;
					else { //Fake add to have audio play
						ds_list_add(confirm_list, i);
						enter_change = true;
					}
				}
			}
			if (val != -1) {
				ds_grid[# 4, i] = clamp(val, 0, 1);
				ds_list_add(confirm_list, i);
				enter_change = true;
				play_sound = false;
			}
			break;
		case menu_element_type.toggle:
			var val = ds_grid[# 4, i];
			if ((hinput != 0 || key_enter) && menu_option[page] == i) {
				val = !val;
			} else if (mouse_check_button_pressed(mb_left)) {
				var text = ds_grid[# 4, i] == 1 ? "ENABLED" : "DISABLED";
				var xleft = start_x[i] + (x_buffer * 2);
				var ycheck = start_y[i];
				if (i == menu_option[page] || scUIHoveringBox(xleft, ycheck, xleft + (string_width(text) * scale_element) + 32, ycheck, x_buffer, y_buffer))
					val = !val;
			}
			if (val != ds_grid[# 4, i]) {
				//AUDIO
				ds_grid[# 4, i] = val;
				ds_list_add(confirm_list, i);
				enter_change = true;
			}
			break;
		case menu_element_type.keybind:
		case menu_element_type.input:
			//HOVERING
			if (key_enter_mouse || key_enter) //Pressed enter
				if (i == menu_option[page])
					input = [page, i, false]; //Got here from selection
				else {
					var rty = start_y[i];
					var rtx = start_x[i] + x_buffer * 2 + x_buffer;
					var len = string_width(scUIGamepadGet(GAMEPAD_TYPE.KEYBOARD, scSettingsGetType(SETTINGS_TYPE.VALUE, ds_grid[# 2, i]))) * scale_element;
					if (scUIHoveringBox(rtx - x_buffer, rty - y_buffer / 2, rtx + x_buffer + len, rty + y_buffer / 2, 0, 0))
						input = [page, i, true]; //Got here from hovering
				}
			if (input != noone && input[0] == page && input[1] == i) {
				//Selection
				switch (input[2]) {
					case false:
						if (i != menu_option[page]) input = noone; break;
					case true:
						var rty = start_y[i];
						var rtx = start_x[i] + x_buffer * 2 + x_buffer;
						var len = string_width(scUIGamepadGet(GAMEPAD_TYPE.KEYBOARD, scSettingsGetType(SETTINGS_TYPE.VALUE, ds_grid[# 2, i]))) * scale_element;
						if (!scUIHoveringBox(rtx - x_buffer, rty - y_buffer / 2, rtx + x_buffer + len, rty + y_buffer / 2, 0, 0))
							input = noone; //Got here from hovering
						break;
				}
			} else
				break; //Not on the same option
			var key = noone;
			if (keyboard_check_pressed(vk_anykey))
				key = keyboard_lastkey;
			if (key == noone /*No key*/ || key == 13 /*Enter key*/ || key == button_down && key == button_up) break; //Invalid key, break out
			var option = ds_grid[# 1, i];
			if (option == menu_element_type.input) {
				if (key != variable_global_get(ds_grid[# 2, i])) {
					//AUDIO
					variable_global_set(ds_grid[# 2, i], key);
					keys_update = true; //Update the keybinds when unpaused (only works in pause screen)
					ds_list_add(confirm_list, i);
					enter_change = true;
				}
			} else if (option == menu_element_type.keybind) { //CACHING
				if (key != scSettingsGetType(SETTINGS_TYPE.VALUE, ds_grid[# 2, i])) {
					//AUDIO
					scSettingsCache(ds_grid[# 2, i], key);
					keys_update = true; //Update the keybinds when unpaused (only works in pause screen)
					ds_list_add(confirm_list, i);
					enter_change = true;
				}
			}
			break;
		case menu_element_type.set_gamepad: //Rebind a controller to a player
			var val = 0;
			var controls = oGame.controllers;
			if (ds_list_size(controls) > 0)
				if (key_enter_mouse || key_enter || hinput != 0) { //Pressed enter
					if (i == menu_option[page] && hinput != 0)
						val += hinput; //Got here from selection
					else if (i == menu_option[page] && (key_enter_mouse || key_enter))
						val++;
					else {
						var rty = start_y[i];
						var rtx = start_x[i] + x_buffer * 2;
						var len = x_buffer * 4;
						rtx += (len / 2) + x_buffer;
						if (scUIHovering(rtx - (len / 2), rty, "<<", x_buffer / 2, y_buffer / 2, scale_element, fa_right)) //Left
							val--;
						else if (scUIHovering(rtx + (len / 2), rty, "<<", x_buffer / 2, y_buffer / 2, scale_element, fa_left))
							val++;
						else
							break;
						var rty = start_y[i];
						var rtx = start_x[i] + x_buffer * 2 + x_buffer;
						var len = string_width("Controller not Connected") * scale_element;
					}
				} else
					break; //No changes
			else
				break; //No controllers
			var pad = ds_grid[# 2, i]; //Pad Type
			var pads = [SETTINGS.PLAYER_1_GAMEPAD, SETTINGS.PLAYER_2_GAMEPAD, 
				SETTINGS.PLAYER_3_GAMEPAD, SETTINGS.PLAYER_4_GAMEPAD];
			var available = noone;
			for (var a = 0; a < ds_list_size(controls); a++) {
				var found = false;
				for (var b = 0; b < array_length_1d(pads); b++)
					if (controls[| a] == scSettingsGetType(SETTINGS_TYPE.VALUE, pads[b])) { //Is an element in controllers on the gamepad list?
						found = true; break; } //Break out, we dont have this key available
				if (!found)
					if (available == noone)
						available[0] = controls[| a];
			}
			if (available != noone) { //We have an available key!
				//if (val == -1) { //Set lower pad or loop if available, else set noone
				scSettingsCache(pad, available[0]);
			} else //None available, so set it to nothing
				scSettingsCache(pad, noone);
			break;
		default: //No custom values, just queue it up for confirm event
			if (menu_option[page] == i)
				ds_list_add(confirm_list, i);
			break;
	}
}

//Not inputting
var option = menu_option[page];
//Mouse Support
if (!unfolding && (device_mouse_x_to_gui(0) != mouse_x_old || device_mouse_y_to_gui(0) != mouse_y_old)) { //Not unfolding and mouse is moving
	mouse_x_old = device_mouse_x_to_gui(0);
	mouse_y_old = device_mouse_y_to_gui(0);
	if (page_workingon == page) //Make sure we are working on the current page
		for (var i = 0; i < ds_grid_height(ds_grid); i++) {
			var ignore = false, val = ds_grid[# 0, i], text = is_array(val) ? val[0] : val;
			for (var a = 0; a < array_length_1d(menu_special); a++)
				if (ds_grid[# 1, i] == menu_special[a]) {ignore = true; break;} //Is this element ignored?
			if (!ignore && is_array(start_x) && scUIHovering(start_x[i], start_y[i], text, x_buffer, 10, scale_main_hovering, centered ? fa_middle : fa_right)) {
				option = i;
				break;} //Set the new option, break away
			else option = -1;
		}
} else {
	//Keyboard support
	//Up and down support
	if (!is_array(start_y) && !is_array(start_x)) exit;
	var ochange = key_down - key_up;
	if (ochange != 0) {
		//newoption += ochange;
		if (option >= 0 && option + ochange >= 0 && option + ochange < ds_height)
			if (start_y[option] == start_y[option + ochange]) option += ochange * 2;
			else option += ochange;
		else option += ochange;
		if (option > ds_height - 1) option = 0;
		else if (option < 0) option = ds_height - 1;
		//Ignore special menu elements
		for (var i = 0; i < array_length_1d(menu_special); i++)
			while (ds_grid[# 1, option] == menu_special[i]) { //Ignore this element, change the option
				option += ochange;
				if (option > ds_height - 1) option = 0;
				else if (option < 0) option = ds_height - 1;
			}
	}
		//Left and right support on horizontally aligned buttons
	else {
		if (hinput != 0) {
			var option = menu_option[page];
			if (option >= 0)
				if (ds_grid[# 1, option] == menu_element_type.toggle_live) {
					val = ds_grid[# 4, option];
					val = clamp(val + hinput, 0, 1);
					if (val != ds_grid[# 4, option]) {
						//ds_grid[# 4, option] = val;
						//script_execute(ds_grid[# 2, option], val);
						key_enter = true;
					}
				} else if (option + hinput >= 0 && option + hinput < ds_height) {
					if (start_y[option] == start_y[option + hinput]) 
						option += hinput;
					else if (option - hinput >= 0 && option - hinput < ds_height)
						if (start_y[option] == start_y[option - hinput]) 
							key_enter = true;
				} else if (option + hinput == ds_height) {
					if (start_y[option] == start_y[option - hinput]) 
						key_enter = true;
				}
		}
	}
}
//Sounds and update selection
if (option != menu_option[page]) { //Not on the same selection
	menu_option[page] = option; //-1 means no option
	if (option != -1) audio_play_sound(SOUND.UI_HOVER, 5, false);
}

//If Enter or Left-Clicking and we have a selection, execute the action
if ((key_enter || key_enter_mouse || enter_change) && ds_exists(ds_grid, ds_type_grid) && ds_list_size(confirm_list) > 0) 
	for (var i = 0; i < ds_list_size(confirm_list); i++) {
		var page_opt = confirm_list[| i];
		button_confirmed = [page_opt, page]; 
		var option = ds_grid[# 1, page_opt];
		switch (option) {
			case menu_element_type.script_runner: //Run a script when selecting
				script_execute(ds_grid[# 2, page_opt]); break;
			case menu_element_type.goto_room: //Change the room, dont care what happens to object
				SlideTransition(TRANS_MODE.GOTO, ds_grid[# 2, page_opt]); control = false; global.pause_possible = false; break; //Remove control and leave the room
			case menu_element_type.page_transfer_script:
				script_execute(ds_grid[# 3, page_opt]);
			case menu_element_type.page_transfer: //Change the page
				for (var i = 0; i < array_length_1d(menu_pages_index); i++) {
					if (menu_pages_index[i] != ds_grid[# 2, page_opt]) continue; //Find the index of the page related to the order
					page = i; checked = false; if (key_enter_mouse) menu_option[page] = -1; break;} //Set new page selection to -1 if mouse was used to enter
				break;
			case menu_element_type.mass_toggle: //If mass toggling
					var op = page_opt;
					var selection = ds_grid[# 6, op] - 1;
					if (selection != -1) {
						var array = ds_grid[# 2, op];
						var values = ds_grid[# 4, op];
						var values_array = values[selection];
						for (var i = 0; i < array_length_1d(array); i++) { //All menu options we are going to change
							var menuSel = array[i];
							var val = values_array[i];
							ds_grid[# 4, menuSel] = val;
							variable_global_set(ds_grid[# 3, menuSel], val);
						}
					}
					variable_global_set(ds_grid[# 5, op], ds_grid[# 6, op]);
				break;
			case menu_element_type.toggle_live: //Toggle with a script
				var val = ds_grid[# 4, page_opt];
				val = clamp(val + 1, 0, 1);
				if (val == ds_grid[# 4, page_opt])
					val = clamp(val - 1, 0, 1);
				ds_grid[# 4, page_opt] = val;
				script_execute(ds_grid[# 2, page_opt], ds_grid[# 4, page_opt]);
				break;
			case menu_element_type.slider: //If its a slider
				if (option == menu_element_type.slider) {
					script_execute(ds_grid[# 2, page_opt], ds_grid[# 4, page_opt], ds_grid[# 5, page_opt]);
					variable_global_set(ds_grid[# 3, page_opt], ds_grid[# 4, page_opt]);
				}
			case menu_element_type.shift: //If we were shifting
				if (option == menu_element_type.shift)
					variable_global_set(ds_grid[# 3, page_opt], ds_grid[# 4, page_opt]);
			case menu_element_type.shift_script: //If we were shifting
				if (option == menu_element_type.shift_script) {
					variable_global_set(ds_grid[# 3, page_opt], ds_grid[# 4, page_opt]);
					script_execute(ds_grid[# 5, page_opt], ds_grid[# 4, page_opt]);
				}
			case menu_element_type.toggle: //If we were toggling
					if (option == menu_element_type.toggle) {
						if (ds_grid[# 2, page_opt] != noone)
							script_execute(ds_grid[# 2, page_opt], ds_grid[# 4, page_opt]);
						if (ds_grid[# 3, page_opt] != noone)
							variable_global_set(ds_grid[# 3, page_opt], ds_grid[# 4, page_opt]);
					}
					for (var i = 0; i < ds_height; i++)
						if (ds_grid[# 1, i] == menu_element_type.mass_toggle) {
							ds_grid[# 6, i] = 0;
							variable_global_set(ds_grid[# 5, i], ds_grid[# 6, i]);
						}
			case menu_element_type.keybind:
			case menu_element_type.input:
		}
		if (play_sound)
			audio_play_sound(SOUND.UI_SELECT, 5, false); //Confirm sound
		input = noone;
	}

ds_list_destroy(confirm_list);