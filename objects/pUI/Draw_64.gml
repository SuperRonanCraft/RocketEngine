draw_set_font(fPixel);
var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
start_y = (RES_H / 2) - (((ds_height - 1) / 2 ) * y_buffer);
start_x = RES_W / 2;
//Make the back button for rocket list to spawn lower
if (ds_grid[# 1, 0] == menu_element_type.rocket_list || ds_grid[# 1, 0] == menu_element_type.rocket_buffs)
	start_y = RES_H / 4 + RES_H / 2;

var c = c_black;
// Draw left
draw_set_valign(fa_middle);
draw_set_halign(fa_right);
var ltx = start_x - x_buffer, lty, xo, scale;
var yy = 0;
var centered = false;
	for (var i = 0; i < array_length_1d(menu_pages_centered); i++)
		if (menu_pages[page] == menu_pages_centered[i])
			centered = true;
repeat (ds_height) {
	var c3 = c_gray;
	scale = 1;
	//Slowly move into the screen
	if (animated && menu_pages_index[page] == menu_page.main)
		start_y += (RES_H / 2 * (1 - unfold[yy]));
	lty = start_y + (yy * y_buffer);
	xo = 0;
	if (yy == menu_option[page]) {
		c3 = c_orange;
		scale = 1.2;
		xo = -(x_buffer / 2);
	}
	if (centered) {
		draw_set_halign(fa_middle);
		scDrawText(start_x, lty, ds_grid[# 0, yy], c3, scale);
	} else
		scDrawText(ltx + xo, lty, ds_grid[# 0, yy], c3, scale);
	yy++;
}

// Draw line
if (!centered) 
	draw_line_width_color(start_x, start_y - y_buffer, start_x, lty + y_buffer, 3, c, c);

// Draw right
draw_set_halign(fa_left);
var rtx = start_x + x_buffer, rty;
yy = 0;
repeat (ds_height) {
	rty = start_y + (yy * y_buffer);
	switch (ds_grid[# 1, yy]) {
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			if (current_val == 0) left_shift = "";
			else if (current_val == array_length_1d(ds_grid[# 4, yy]) - 1) right_shift = "";
			c = c_ltgray;
			c2 = c_black;
			if (inputting && yy == menu_option[page]) c = c_yellow;
			scDrawText(rtx, rty, left_shift + current_array[current_val] + right_shift, c2, 0.6);
			//draw_text_transformed_color(rtx + 2, rty + 2, left_shift + current_array[current_val] + right_shift, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			//draw_text_transformed_color(rtx, rty, left_shift + current_array[current_val] + right_shift, 0.6, 0.6, 0, c, c, c, c, 1);
			break;
		case menu_element_type.slider:
			var len = 128;
			var circle_pos = ds_grid[# 4, yy];
			c = c_ltgray;
			if (inputting && yy == menu_option[page]) c = c_yellow;
			draw_line_width_color(rtx, rty, rtx + len, rty, 4, c, c);
			draw_circle_color(rtx + (circle_pos * len), rty, 4, c, c, false);
			scDrawText(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%", c, 0.6);
			//draw_text_transformed_color(rtx + (len * 1.2) + 2, rty + 2, string(floor(circle_pos * 100)) + "%", 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			//draw_text_transformed_color(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%", 0.6, 0.6, 0, c, c, c, c, 1);
			break;
		case menu_element_type.toggle:
			var current_val = ds_grid[# 4, yy];
			var c1, c2, c = c_ltgray;
			if (inputting && yy == menu_option[page]) c = c_yellow;
			if (current_val == 1) { c1 = c; c2 = c_dkgray;
			} else { c1 = c_dkgray; c2 = c;}
			scDrawText(rtx, rty, "ON", c1, 0.6);
			scDrawText(rtx + 96 , rty, "OFF", c2, 0.6);
			//draw_text_transformed_color(rtx + 2, rty + 2, "ON", 0.6, 0.6, 0, c3, c3, c3, c3, 1);
			//draw_text_transformed_color(rtx, rty, "ON", 0.6, 0.6, 0, c1, c1, c1, c1, 1);
			//draw_text_transformed_color(rtx + 96 + 2, rty + 2, "OFF", 0.6, 0.6, 0, c3, c3, c3, c3, 1);
			//draw_text_transformed_color(rtx + 96, rty, "OFF", 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			break;
		case menu_element_type.input:
			var string_val = scKeyToString(variable_global_get(ds_grid[# 2, yy]));
			c = c_ltgray;
			if (inputting && yy == menu_option[page]){ c = c_yellow; string_val = string_val + " | Press any key!"}
			scDrawText(rtx, rty, string_val, c, 0.6);
			//draw_text_transformed_color(rtx + 2, rty + 2, string_val, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			//draw_text_transformed_color(rtx, rty, string_val, 0.6, 0.6, 0, c, c, c, c, 1);
			break;
		case menu_element_type.goto_room:
			draw_set_halign(fa_middle);
			var string_val = ds_grid[# 3, yy];
			//c = c_ltgray;
			//c2 = c_black
			scDrawText(start_x, rty + 20, string_val, c_ltgray, 0.6);
			//draw_text_transformed_color(start_x + 2, rty + 22, string_val, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			//draw_text_transformed_color(start_x, rty + 20, string_val, 0.6, 0.6, 0, c, c, c, c, 1);
			break;
		case menu_element_type.rocket_list:
			//c = c_white;
			//c2 = c_black
			//c3 = c_yellow;
			var amt = ROCKET.LENGHT;
			var columns = 4;
			var offset = 0;
			draw_set_halign(fa_middle);
			for (var i = 1; i < amt; i++) {
				if ((i - 1) mod columns == 0)
					offset++;
				var map = weapons[i];
				var spr = map[? ROCKET_MAP.PROJECTILE];
				var name = map[? ROCKET_MAP.NAME];
				var desc = map[? ROCKET_MAP.DESCRIPTION];
				var buffs = map[? ROCKET_MAP.BUFF];
				var rx = ((RES_W / 8) + ((RES_W / 4) * (i - 1))) - ((offset - 1) * ((RES_W / 4) * columns));
				var ry = offset * 130 + 40;
				//Name
				scDrawText(rx, ry, name, c_white, 0.6);
				//draw_text_transformed_color(rx + 2, ry + 2, name, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
				//draw_text_transformed_color(rx, ry, name, 0.6, 0.6, 0, c, c, c, c, 1);
				//Sprite
				draw_sprite(spr, 0, rx, ry + 30);
				//Buffs of rocket
				if (!is_undefined(buffs)) {
					var bamt = array_length_1d(buffs);
					for (var b = 0; b < bamt; b++) {
						var map = ds_map_create();
						scGetBuff(buffs[b], map);
						draw_sprite_ext(map[? "icon"], 0, rx - (bamt * 20) + (40 * b) + 4, ry + 70, 0.5, 0.5, 0, c_white, 1);
						ds_map_destroy(map);
					}
				}
				//Description
				scDrawText(rx, ry + 60, desc, c_yellow, 0.6);
				//draw_text_transformed_color(rx + 2, ry + 62, desc, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
				//draw_text_transformed_color(rx, ry + 60, desc, 0.6, 0.6, 0, c3, c3, c3, c3, 1);
			}
			break;
		case menu_element_type.rocket_buffs:
			//c = c_white;
			//c2 = c_black
			//c3 = c_yellow;
			var amt = BUFFTYPE.LENGHT;
			var columns = 3;
			var offset = 0;
			draw_set_halign(fa_middle);
			for (var i = 0; i < amt; i++) {
				if (i mod columns == 0)
					offset++;
				var map = ds_map_create();
				scGetBuff(i, map);
				var spr = map[? "icon"];
				var name = map[? "name"];
				var desc = map[? "description"];
				var part = map[? "particle"];
				var rx = ((RES_W / 4) + ((RES_W / 4) * i)) - ((offset - 1) * ((RES_W / 4) * columns));
				var ry = offset * 150 + 10;
				//Name
				scDrawText(rx, ry, name, c_white, 0.6);
				//draw_text_transformed_color(rx + 2, ry + 2, name, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
				//draw_text_transformed_color(rx, ry, name, 0.6, 0.6, 0, c, c, c, c, 1);
				//Sprite
				part_emitter_region(global.ParticleSystem1, global.Emitter1, rx - (1*30), rx + (1*30), ry - (1*10) + sprite_get_height(spr) + 20, ry + (1*10) + sprite_get_height(spr) + 20, ps_shape_ellipse, ps_distr_gaussian)
				part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, 15*1);
				draw_sprite(spr, 0, rx - sprite_get_width(spr) / 2, ry + 20);
				//Description
				scDrawText(rx, ry + 110, desc, c_yellow, 0.6);
				//draw_text_transformed_color(rx + 2, ry + 112, desc, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
				//draw_text_transformed_color(rx, ry + 110, desc, 0.6, 0.6, 0, c3, c3, c3, c3, 1);
				ds_map_destroy(map);
			}
			break;
	}
	yy++;
}

draw_set_valign(fa_top);