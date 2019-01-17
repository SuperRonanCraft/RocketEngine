/// @desc Draw all element types

//Grid values, grid length, page working on
var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid), workingon = page_workingon;

if (workingon != page) { //New page, lets set it up
	page_workingon = page;
	//Scales
	scale_option = 0; //Reset array
	for (var i = 0; i < ds_height; i++) scale_option[i] = scale_main; //Set default size for option
	//Centered?
	var centering = false;
	for (var i = 0; i < array_length_1d(menu_pages_centered); i++)
		if (menu_pages[page] == menu_pages_centered[i])
			centering = true;
	centered = centering;
	//Positions
	start_x = 0;
	start_y = 0;
	var index = 0, skips = 1;
	for (var i = index; i < ds_height; i++) {
		var yoffset = -(((ds_height - 1) / 2) * y_buffer) + (index * y_buffer), yy = 0;
		start_x[i] = centered ? start_x_default : start_x_default - x_buffer;
		if (is_array(ds_grid[# 0, i])) {
			var arr = ds_grid[# 0, i];
			var bffr = (x_buffer * 4)
			switch (arr[1]) {
				case menu_centered.left: start_x[i] -= bffr; break;
				case menu_centered.right: start_x[i] += bffr; break;}
			if (skips <= 0) skips = 1; //Maximum of 1 skip allowed
			else {index--; skips--;} //Makes the y not count up
		}
		//Make the buttons for special menus to spawn lower than normal
		for (var a = 0; a < array_length_1d(menu_special); a++)
			if (ds_grid[# 1, 0] == menu_special[a]) {
				yy = menu_special_start_y[a] + yoffset; break;}
		start_y[i] = yy == 0 ? start_y_default + yoffset : yy;
		index++;
	}
	button_confirmed = 0; //Reset confirm button
} else { //On same page as before
	for (var i = 0; i < ds_height; i++)
		if (i == menu_option[page]) {
			if (is_array(button_confirmed) && button_confirmed[0] == i && button_confirmed[1] == page) {
				var val = max(scale_option[i] - scale_change, scale_main);
				if (val == scale_main) button_confirmed = 0; //Done animating, reset array
				scale_option[i] = val;
			} else
				scale_option[i] = min(scale_option[i] + scale_change, scale_main_hovering);
		} else
			scale_option[i] = max(scale_option[i] - scale_change, scale_main);
}

scUIUnfold(); //Unfolding event

// Draw left
for (var i = 0; i < ds_height; i++) {
	//Color, Scale, Y-pos, X-offset
	var c_main = color_main, scale = scale_option[i], lty = start_y[i], xo = 0, text = ds_grid[# 0, i], ltx = start_x[i];
	if (unfolding) lty += (RES_H / 2 * (1 - unfold[i]));
	if (i == menu_option[page]) {ltx += scMovementWave(-4, 4, 2); c_main = color_main_hovering; xo = -(x_buffer / 2);}
	scDrawText(centered ? ltx : ltx + xo, lty, is_array(text) ? text[0] : text, c_main, scale, noone, noone, centered ? fa_middle : fa_right);
	//Button hover descriptions

	switch (ds_grid[# 1, i]) {
		case menu_element_type.script_runner:
			if (ds_grid[# 4, i] == true && menu_option[page] != i) break;
		case menu_element_type.goto_room:
			if (ds_grid[# 3, i] == 0) break; //No text option
			var string_val = ds_grid[# 3, i];
			scDrawText(start_x[i], lty + 25, string_val, color_element, scale_description, noone, noone, centered ? fa_middle : fa_right); //Description of button
			break;
		case menu_element_type.shift:
		case menu_element_type.toggle:
			if (menu_option[page] != i || ds_grid[# 5, i] == 0) break; //No text option
			var string_val = ds_grid[# 5, i];
			scDrawText(start_x[i] + xo, lty + 25, string_val, color_element, scale_description, noone, noone, fa_right);
			break;
		case menu_element_type.page_transfer:
			if (menu_option[page] != i || ds_grid[# 3, i] == 0) break; //No text option
			var string_val = ds_grid[# 3, i];
			scDrawText(start_x[i], lty + 25, string_val, color_element, scale_description, noone, noone, centered ? fa_middle : fa_right);
			break;
	}
}

// Draw center line
if (!centered) 
	draw_line_width_color(start_x_default, start_y[0] - y_buffer, start_x_default, start_y[ds_height - 1] + y_buffer, 3, color_seperator, color_seperator);

// Draw right
var rtx, rty; //right-Xpos, right-Ypos
for (var i = 0; i < ds_height; i++) { //Iterate through each grid of the current page
	rty = start_y[i];
	rtx = start_x[i] + x_buffer * 2;
	if (inputting && menu_option[page] == i && ds_grid[# 1, i] != menu_element_type.input)
		scDrawText(rtx, rty - (y_buffer / 2), "Use Right-Mouse Button or Arrow keys", color_element_special, 0.4, noone, 0.8, fa_left);
	switch (ds_grid[# 1, i]) {
		case menu_element_type.shift:
			var current_val = ds_grid[# 4, i], current_array = ds_grid[# 2, i], c = color_element;
			var left_shift = "<< ", right_shift = " >>";
			if (current_val == 0) left_shift = "";
			else if (current_val == array_length_1d(current_array) - 1) right_shift = "";
			if (inputting && i == menu_option[page]) c = color_element_input;
			scDrawText(rtx, rty, left_shift + string(current_array[current_val]) + right_shift, c, scale_element, noone, noone, fa_left);
			break;
		case menu_element_type.slider:
			var len = slider_width, circle_pos = ds_grid[# 4, i], c = c_ltgray;
			if (inputting && i == menu_option[page]) c = c_yellow;
			//draw_line_width_color(rtx, rty, rtx + len, rty, 4, c, c);
			//draw_circle_color(rtx + (circle_pos * len), rty, 4, c, c, false);
			scDrawText(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%", c, scale_element, noone, noone, fa_left);
			//Slider bar
			draw_sprite_part_ext(sUISliderBar, 1, 0, 0, circle_pos * len, len, rtx, rty - 4, 1, 1, c_white, 0.8);
			draw_sprite_part_ext(sUISliderBar, 0, circle_pos * len, 0, len, 10, rtx + circle_pos * len, rty - 4, 1, 1, c_white, 0.8);
			//Slider button
			draw_sprite_ext(sUISliderButton, 0, rtx + (circle_pos * len), rty, 1, 1, 0, c_white, 0.8);
			break;
		case menu_element_type.toggle:
			var current_val = ds_grid[# 4, i];
			var c = inputting && i == menu_option[page] ? color_element_input : color_element	
			scDrawText(rtx + 32, rty, current_val == 1 ? "ENABLED" : "DISABLED", c, scale_element, noone, noone, fa_left);
			draw_sprite(sUIToggle, current_val, rtx, rty - 8);
			break;
		case menu_element_type.input:
			var string_val = scKeyToString(variable_global_get(ds_grid[# 2, i])), c = color_element;
			if (inputting && i == menu_option[page]) { c = color_element_input; string_val = string(string_val) + " | Press any key!"}
			scDrawText(rtx, rty, string_val, c, scale_element, noone, noone, fa_left);
			break;
		case menu_element_type.mass_toggle:
			var current_val = ds_grid[# 5, i], current_array = ds_grid[# 3, i], c = color_element;
			var left_shift = "<< ", right_shift = " >>";
			if (current_val == 0) left_shift = "";
			else if (current_val == array_length_1d(current_array) - 1) right_shift = "";
			if (inputting && i == menu_option[page]) c = color_element_input;
			scDrawText(rtx, rty, left_shift + string(current_array[current_val]) + right_shift, c, scale_element, noone, noone, fa_left);
			break;
		case menu_element_type.rocket_list: //Rocket info page
			scMenuRocketList(); break;
		case menu_element_type.rocket_buffs: //Buffs list
			scMenuRocketBuffs(); break;
		case menu_element_type.controls: //Key controls page
			scMenuControls(); break;
	}
}