/// @desc Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Mouse moving / selection
if (menu_control) {
	var current_mouse_y = mouse_y - (view_camera[0] != -1 ? camera_get_view_x(view_get_camera(view_camera[0])) : 0);
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
		audio_play_sound(SOUND.UI_SELECT, 10, false);
	}
} else if (menu_x > gui_width + 160 && menu_committed != -1) 
	switch (menu_committed) {
		case 2: //Toggle pause
			with (oGame)
				event_user(0);
			instance_destroy();
			break;
		case 1: //Show options
			instance_change(oUIOptions, true);
			break;
		case 0: //Quit to title screen
			with (oGame)
				event_user(0);
			SlideTransition(TRANS_MODE.GOTO, rMenu);
			break;
		default:
			SlideTransition(TRANS_MODE.RESTART);
			break;
	}
else if (oTransition.mode == TRANS_MODE.RESTART)
	menu_x_target = gui_width + 200;