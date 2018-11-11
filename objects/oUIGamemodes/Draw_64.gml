/// @desc Draw Menu

draw_set_font(menu_font);
draw_set_halign(fa_middle);
draw_set_valign(fa_bottom);
var changed = menu_cursor_old != menu_cursor && menu_cursor != -1;
menu_cursor_old = menu_cursor;


for (var i = 0; i < menu_items; i++) {
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i){
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	} else
		var col = c_gray;
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	draw_set_color(c_black);
	draw_text(xx + offset, yy + offset, txt);
	draw_set_color(col);
	draw_text(xx, yy, txt);
	if (changed)
		audio_play_sound(snHover, 1, false)
}
draw_set_color(c_black);
draw_rectangle(gui_width, gui_height - 600, gui_width + 200, gui_height - 200, false);