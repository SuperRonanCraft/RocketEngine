enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input,
	goto_room,
}

page = 0;
menu_option = 0;
inputting = false;
depth -= 1;
checked = false;

//Mouse control
mouse_x_old = 0;
mouse_y_old = 0;