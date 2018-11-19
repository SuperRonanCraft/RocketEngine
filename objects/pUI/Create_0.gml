//Kind of special elements
enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input,
	goto_room,
}

//Menu settings
page = 0;
menu_option = 0;
menu_pages = 0;
menu_pages_centered = 0;
inputting = false;
checked = false;

//Mouse control
mouse_x_old = 0;
mouse_y_old = 0;
y_buffer = 64;
x_buffer = 32;
start_y = 0;
start_x = 0;
mouse_moving = false;

//Defaults
depth -= 1;