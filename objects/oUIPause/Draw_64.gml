if (!global.pause) exit;

draw_set_font(fPixel);
var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var y_buffer = 64, x_buffer = 32;
var start_y = (RES_H / 2) - ((((ds_height - 1) / 2 ) * y_buffer)), start_x = RES_W / 2;

// Draw Pause
var c = c_black;
//draw_rectangle_color(0, 0, RES_W, RES_H, c, c, c, c, false);

// Draw left
draw_set_valign(fa_middle);
draw_set_halign(fa_right);
var ltx = start_x - x_buffer, lty, xo;
var yy = 0; repeat (ds_height) {
	lty = start_y + (yy * y_buffer);
	c = c_gray;
	c2 = c_black;
	xo = 0;
	if (yy == menu_option[page]) {
		c = c_orange;
		xo = -(x_buffer / 2);
	}
	draw_text_color(ltx + xo + 2, lty + 2, ds_grid[# 0, yy], c2, c2, c2, c2, 1);
	draw_text_color(ltx + xo, lty, ds_grid[# 0, yy], c, c, c, c, 1);
	yy++;
}

// Draw line
draw_set_color(c_black);
draw_line_width(start_x, start_y - y_buffer, start_x, lty + y_buffer, 2);

// Draw right
draw_set_halign(fa_left);
var rtx = start_x + x_buffer, rty;
yy = 0; repeat (ds_height) {
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
			draw_text_transformed_color(rtx + 2, rty + 2, left_shift + current_array[current_val] + right_shift, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			draw_text_transformed_color(rtx, rty, left_shift + current_array[current_val] + right_shift, 0.6, 0.6, 0, c, c, c, c, 1);
			break;
		case menu_element_type.slider:
			var len = 128;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / current_array[1] - current_array[0]);
			c = c_ltgray;
			c2 = c_black;
			if (inputting && yy == menu_option[page]) c = c_yellow;
			draw_set_color(c);
			draw_line_width(rtx, rty, rtx + len, rty, 4);
			draw_circle_color(rtx + (circle_pos * len), rty, 4, c, c, false);
			draw_text_transformed_color(rtx + (len * 1.2) + 2, rty + 2, string(floor(circle_pos * 100)) + "%", 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			draw_text_transformed_color(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%", 0.6, 0.6, 0, c, c, c, c, 1);
			break;
		case menu_element_type.toggle:
			var current_val = ds_grid[# 3, yy];
			var c1, c2, c = c_ltgray, c3 = c_black;
			if (inputting && yy == menu_option[page]) c = c_yellow;
			if (current_val == 0) { c1 = c; c2 = c_dkgray;
			} else { c1 = c_dkgray; c2 = c;}
			draw_text_transformed_color(rtx + 2, rty + 2, "ON", 0.6, 0.6, 0, c3, c3, c3, c3, 1);
			draw_text_transformed_color(rtx, rty, "ON", 0.6, 0.6, 0, c1, c1, c1, c1, 1);
			draw_text_transformed_color(rtx + 96 + 2, rty + 2, "OFF", 0.6, 0.6, 0, c3, c3, c3, c3, 1);
			draw_text_transformed_color(rtx + 96, rty, "OFF", 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			break;
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			var string_val;
			switch (current_val) {
				case vk_up: string_val = "UP KEY"; break;
				case vk_left: string_val = "LEFT KEY"; break;
				case vk_right: string_val = "RIGHT KEY"; break;
				case vk_down: string_val = "DOWN KEY"; break;
				default: string_val = chr(current_val); break;
			}
			c = c_ltgray;
			if (inputting && yy == menu_option[page]) c = c_yellow;
			c2 = c_black
			draw_text_transformed_color(rtx + 2, rty + 2, string_val, 0.6, 0.6, 0, c2, c2, c2, c2, 1);
			draw_text_transformed_color(rtx, rty, string_val, 0.6, 0.6, 0, c, c, c, c, 1);
	}
	yy++;
}

draw_set_valign(fa_top);