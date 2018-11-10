/// @desc Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Mouse moving / selection
if (menu_control) {
	var current_mouse_y = device_mouse_y_to_gui(0)
	if (mouse_y_gui == current_mouse_y)
		mouse_moving = 0;
	else {
		mouse_y_gui = current_mouse_y;
		mouse_moving = 1;
	}

	//Keyboard Controls / selection
	if (mouse_moving){
		if (mouse_y_gui < menu_y && mouse_y_gui > menu_top)
			menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		else
			menu_cursor = -1;
	} else if (menu_cursor >= 0 && mouse_check_button_pressed(mb_left)) {
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		//ScreenShake(4, 30);
		menu_control = false;
		audio_play_sound(snSelect, 10, false);
	}
} else if (menu_x > gui_width + 160 && menu_committed != -1) 
	switch (menu_committed) {
		case 2:
			window_set_fullscreen(!window_get_fullscreen());
			if (window_get_fullscreen())
				menu[2] = "Windowed";
			else
				menu[2] = "Fullscreen";
			menu_committed = -1;
			obj_deleting = false;
			menu_control = true;
			menu_x_target = gui_width - gui_margin;
			break;
		case 1:
			menu_committed = -1;
			obj_deleting = false;
			menu_control = true;
			menu_x_target = gui_width - gui_margin;
			break;
		case 0: 
			obj_deleting = true;
			instance_change(oMenu, true);
			break;
		default:
			obj_deleting = true;
			SlideTransition(TRANS_MODE.RESTART);
			break;
	}
else if (oTransition.mode == TRANS_MODE.RESTART)
	menu_x_target = gui_width + 200;
if (!(menu_x > gui_width + 160 && menu_committed != -1))
	for (var i = 0; i < obj_items; i++) {
		if (obj[i] != noone)
			if (!obj_created[i]) {
				instance_create_layer(menu_x, menu_y + (i * 50) + 50, layer, obj[i]);
				obj_created[i] = true;
			} else 
				obj[i].x = menu_x;
	}
else if (obj_deleting) {
	for (var i = 0; i < obj_items; i++) {
		if (obj_created[i])
			instance_destroy(obj[i]);
	}
}
//layer_x(oCamera.mountainLayer, 1);
//layer_x(oCamera.treesLayer, 4);