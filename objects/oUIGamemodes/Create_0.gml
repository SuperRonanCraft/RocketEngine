/// @desc GUI/Vars/Menu setup
gui_width = RES_W;
gui_height = RES_H;
gui_margin = gui_width / 2;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin + 150;
menu_x_target = gui_width - gui_margin;
menu_speed = 10; //lower is faster
menu_font = fPixel;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_cursor_old = menu_cursor;
menu_control = true;

//Menu items to display
menu = 0;
menu[0] = "Back";
for (var i = array_length_1d(global.gamemodes); i > 0; i--)
	menu[ array_length_1d(menu)] = global.gamemodes[i - 1];

menu_items = array_length_1d(menu);
menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

//Special object to spawn in (sliders)
obj[0] = noone;
obj_created = 0;

obj_items = array_length_1d(obj);
for (var i = 0; i < obj_items; i++)
	obj_created[i] = false;
obj_deleting = false;