/// @desc Draw all element types

//Grid values, grid length, page we're working on
var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid), workingon = page_workingon;
if (workingon != page) { //Only update once per page change
	start_y = (RES_H / 2) - (((ds_height - 1) / 2) * y_buffer);
	start_x = RES_W / 2;
	page_workingon = page;
	var centering = false;
	for (var i = 0; i < array_length_1d(menu_pages_centered); i++)
		if (menu_pages[page] == menu_pages_centered[i])
			centering = true;
	centered = centering;
}

//Make the buttons for special menus to spawn lower than normal
for (var i = 0; i < array_length_1d(menu_special); i++)
	if (ds_grid[# 1, 0] == menu_special[i]) {start_y = menu_special_start_y[i]; break;}

//Scales
if (workingon == page) {
	for (var i = 0; i < ds_height; i++)
		if (i == menu_option[page])
			scale_option[i] = min(scale_option[i] + scale_change, scale_main_hovering);
		else
			scale_option[i] = max(scale_option[i] - scale_change, scale_main);
} else {
	scale_option = 0; //Reset array
	for (var i = 0; i < ds_height; i++)
		scale_option[i] = scale_main; //Set default size for option
}

// Draw left
for (var i = 0; i < ds_height; i++) {
	//Color, Scale, Y-pos, X-offset
	var c_main = color_main, scale = scale_option[i], lty = start_y + (i * y_buffer), xo = 0;
	if (unfolding && menu_pages_index[page] == menu_page.main)
		lty += (RES_H / 2 * (1 - unfold[i]));
	if (i == menu_option[page]) {c_main = color_main_hovering; xo = -(x_buffer / 2);}
	scDrawText(centered ? start_x : (start_x - x_buffer + xo), lty, ds_grid[# 0, i], c_main, scale, noone, noone, centered ? fa_middle : fa_right);
}

// Draw center line
if (!centered) 
	draw_line_width_color(start_x, start_y - y_buffer, start_x, (start_y + (ds_height * y_buffer)) + y_buffer, 3, color_seperator, color_seperator);

// Draw right
var rtx = start_x + x_buffer, rty; //right-Xpos, right-Ypos
for (var i = 0; i < ds_height; i++) { //Iterate through each grid of the current page
	rty = start_y + (i * y_buffer);
	switch (ds_grid[# 1, i]) {
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, i], current_array = ds_grid[# 4, i], c = color_element;
			var left_shift = "<< ", right_shift = " >>";
			if (current_val == 0) left_shift = "";
			else if (current_val == array_length_1d(ds_grid[# 4, i]) - 1) right_shift = "";
			if (inputting && i == menu_option[page]) c = color_element_input;
			scDrawText(rtx, rty, left_shift + current_array[current_val] + right_shift, c, scale_element, noone, noone, fa_left);
			break;
		case menu_element_type.slider:
			var len = slider_width, circle_pos = ds_grid[# 4, i], c = c_ltgray;
			if (inputting && i == menu_option[page]) c = c_yellow;
			draw_line_width_color(rtx, rty, rtx + len, rty, 4, c, c);
			draw_circle_color(rtx + (circle_pos * len), rty, 4, c, c, false);
			scDrawText(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%", c, scale_element, noone, noone, fa_left);
			break;
		case menu_element_type.toggle:
			var current_val = ds_grid[# 4, i];
			var c1, c2, c = color_element;
			if (inputting && i == menu_option[page]) c = color_element_input;
			if (current_val == 1) { c1 = c; c2 = color_element_input_unselected;
			} else { c1 = color_element_input_unselected; c2 = c;}
			scDrawText(rtx, rty, "ON", c1, scale_element, noone, noone, fa_left);
			scDrawText(rtx + 96 , rty, "OFF", c2, scale_element, noone, noone, fa_left);
			break;
		case menu_element_type.input:
			var string_val = scKeyToString(variable_global_get(ds_grid[# 2, i])), c = color_element;
			if (inputting && i == menu_option[page]) { c = color_element_input; string_val = string(string_val) + " | Press any key!"}
			scDrawText(rtx, rty, string_val, c, scale_element, noone, noone, fa_left);
			break;
		case menu_element_type.script_runner:
			if (ds_grid[# 3, i] == 0) break; //No text option
		case menu_element_type.goto_room:
			var string_val = ds_grid[# 3, i];
			scDrawText(start_x, rty + 25, string_val, color_element, scale_description); //Description of button
			break;
		case menu_element_type.rocket_list:
			var amt = ROCKET.LENGHT, columns = 4, offset = 0;
			for (var i = 1; i < amt; i++) {
				var map = weapons[i];
				if (!is_undefined(map[? ROCKET_MAP.ENABLED]) && !map[? ROCKET_MAP.ENABLED]) continue; //Is it disabled?
				if ((i - 1) mod columns == 0)
					offset++;
				var spr = map[? ROCKET_MAP.PROJECTILE];
				var name = map[? ROCKET_MAP.NAME];
				var desc = map[? ROCKET_MAP.DESCRIPTION];
				var buffs = map[? ROCKET_MAP.BUFF];
				var rx = ((RES_W / 8) + ((RES_W / 4) * (i - 1))) - ((offset - 1) * ((RES_W / 4) * columns));
				var ry = offset * 130 + 40;
				scDrawText(rx, ry, name, color_element, scale_element); //Rocket name
				draw_sprite(spr, 0, rx, ry + 30); //Rocket icon
				if (!is_undefined(buffs)) { //Rocket buffs if exists
					var bamt = array_length_1d(buffs);
					for (var b = 0; b < bamt; b++) {
						var map = ds_map_create();
						scGetBuff(buffs[b], map);
						draw_sprite_ext(map[? BUFF_MAP.ICON], 0, rx - (bamt * 20) + (40 * b) + 4, ry + 70, 0.5, 0.5, 0, c_white, 1);
						ds_map_destroy(map);
					}
				}
				scDrawText(rx, ry + 60, desc, color_element_input, scale_description); //Rocket Description
				draw_line_width_color(rx - 64, ry + 106, rx + 64, ry + 106, 2, c_black, c_black);
			}
			break;
		case menu_element_type.rocket_buffs: //Buffs list
			var amt = BUFFTYPE.LENGHT, columns = 3, offset = 0;
			for (var i = 0; i < amt; i++) {
				if (i mod columns == 0)
					offset++;
				var map = ds_map_create();
				scGetBuff(i, map); //Grab the buff map
				var spr = map[? BUFF_MAP.ICON]; //Grab the icon
				var name = map[? BUFF_MAP.NAME]; //Grab the name
				var desc = map[? BUFF_MAP.DESCRIPTION]; //Grab the description
				var part = map[? BUFF_MAP.PARTICLE]; //Grab the particle
				var part_amt = map[? BUFF_MAP.PARTICLE_AMT]; //Grab the amount of particles
				var rx = ((RES_W / 4) + ((RES_W / 4) * i)) - ((offset - 1) * ((RES_W / 4) * columns));
				var ry = offset * 150 + 10;
				scDrawText(rx, ry, name, color_element, scale_element); //Buff name
				//Particles
				part_emitter_region(global.ParticleSystem1, global.Emitter1, rx - (1*30), rx + (1*30),
					ry - (1*10) + sprite_get_height(spr) + 20, ry + (1*10) + sprite_get_height(spr) + 20,
					ps_shape_ellipse, ps_distr_gaussian)
				part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, part_amt);
				draw_sprite(spr, 0, rx - 32, ry + 20); //Buff icon
				scDrawText(rx, ry + 110, desc, color_element_input, 0.45); //Buff description
				draw_line_width_color(rx - 64, ry + 122, rx + 64, ry + 122, 2, c_black, c_black); //Seperator line
				ds_map_destroy(map);
			}
			break;
		case menu_element_type.controls: //Key controls page
			var rad = 10, width = 35;
			var up_x = RES_W / 4, down_x = up_x, left_x = up_x - 110, right_x = up_x + 110; //X Values
			var up_y = RES_W / 4, down_y = up_y + 110, left_y = down_y, right_y = down_y; //Y Values
			var btn_x, btn_y, btn, btn_reason;
			//Keybinds
			for (var a = 0; a < 2; a++) { //Playerid
				scDrawText(a == 0 ? up_x : up_x + RES_W / 2, up_y - width - 50, a == 0 ? "Player 1" : "Player 2", color_element_special, scale_main); //Player side
				for (var i = 0; i < 4; i++) { //Amount of btns
					switch (i) { //btn x/y, reason and id
						case 0: btn_x = up_x; btn_y = up_y; btn = (a == 0 ? global.key_p1_jump : global.key_p2_jump); btn_reason = "JUMP"; break;
						case 1: btn_x = down_x; btn_y = down_y; btn = (a == 0 ? global.key_p1_shoot : global.key_p2_shoot); btn_reason = "SHOOT"; break;
						case 2: btn_x = left_x; btn_y = left_y; btn = (a == 0 ? global.key_p1_left : global.key_p2_left); btn_reason = "LEFT"; break;
						case 3: btn_x = right_x; btn_y = right_y; btn = (a == 0 ? global.key_p1_right : global.key_p2_right); btn_reason = "RIGHT"; break;
					}
					var btn_x = (a == 0 ? btn_x : btn_x + RES_W / 2);
					draw_roundrect_color_ext(btn_x + width, btn_y + width, btn_x - width, btn_y - width, rad, rad, c_black, c_black, true);
					var scale = 0.65;
					if (keyboard_check(btn)) scale = 0.8; //Scale up if pressing button
					scDrawText(btn_x, btn_y, scKeyToString(btn), color_element_input, scale); //Button text
					scDrawText(btn_x, btn_y - width - 10, btn_reason, color_element, 0.7); //Button reason
				}
			}
			//Ultimates
			for (var a = 0; a < 2; a++) { //Player ids
				var prev = false;
				for (var i = 0; i < 2; i++) { //Amount of btns
					switch (i) { //Which btn to work on
						case 0: btn_x = left_x + width; btn_y = left_y + 150; break;
						case 1: btn_x = right_x - width; btn_y = left_y + 150; break;}
					btn_x = (a == 0 ? btn_x : btn_x + RES_W / 2);
					draw_roundrect_color_ext(btn_x + width, btn_y + width, btn_x - width, btn_y - width, rad, rad, c_black, c_black, true);
					switch (i) { //Which keybind
						case 0: btn = (a == 0 ? global.key_p1_left : global.key_p2_left); break;
						case 1: btn = (a == 0 ? global.key_p1_right : global.key_p2_right); break;}
					var scale = 0.65;
					if (keyboard_check(btn)) {scale = 0.8; if (i == 0) prev = true;}
					scDrawText(btn_x, btn_y, scKeyToString(btn), color_element_input, scale); //Ult buttons
					if (i == 1) { //Draw once per player on the last button
						btn_x = (a == 0 ? down_x : down_x + RES_W / 2)
						scDrawText(btn_x, btn_y - 50, "ULTIMATE", color_element_special, scale_main); //Ult text
						scDrawText(btn_x, btn_y, "+", color_element_input, prev ? scale : 0.65); //Plus text
					}
				}
			}
			break;
	}
}