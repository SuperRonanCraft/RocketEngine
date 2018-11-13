/// @desc Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Mouse moving / selection
if (menu_control) { 
	var current_mouse_y = mouse_y;
	if (mouse_y_gui == current_mouse_y)
		mouse_moving = 0;
	else {
		mouse_y_gui = current_mouse_y;
		mouse_moving = 1;
	}
//Keyboard Controls / selection
	if (mouse_moving){
		if (mouse_y_gui < menu_y && mouse_y_gui > menu_top) {
			menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		} else
			menu_cursor = -1;
	} else if (menu_cursor >= 0 && mouse_check_button_pressed(mb_left)) {
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		//ScreenShake(4, 30);
		menu_control = false;
		audio_play_sound(SOUND.UI_SELECT, 10, false);
	}
//Committed a selection
} else if (menu_x > gui_width + 160 && menu_committed != -1)
	switch (menu_committed) {
		//Gamemodes
		case 2:
			instance_change(oUIGamemodes, true);
			break;
		//Options
		case 1:
			instance_change(oUIOptions, true);
			break;
		case 0: 
			game_end();
			break;
		default:
			SlideTransition(TRANS_MODE.RESTART);
			break;
	}
else if (oTransition.mode == TRANS_MODE.RESTART)
	menu_x_target = gui_width + 200;
//layer_x(oCamera.mountainLayer, 1);
//layer_x(oCamera.treesLayer, 4);