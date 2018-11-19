///Kind of special elements
enum menu_element_type {
	//Run a script
	script_runner,
	//Go to another page (enum value)
	page_transfer,
	//Is a type of input
	slider,
	//Go from one value to another
	shift,
	//Toggle from true <-> false
	toggle,
	//Takes a key input
	input,
	//Go to a room
	goto_room,
}

///Menu settings
//The page we are on
page = 0;
//The option we have selected in a page
menu_option = 0;
//All the pages we have loaded in a ui
menu_pages = 0;
//All the pages we want centered (should only be a 'script_runner', 'page_transfer' or 'goto_room')
menu_pages_centered = 0;
//If we are inputting values 'slider', 'shift', ;toggle' or 'input')
inputting = false;
//If we have refreshed the values to global values, such as the keybinds, resolution and volume
checked = false;

///Mouse control
mouse_x_old = 0;
mouse_y_old = 0;
//Spacing between buttons
y_buffer = 64;
//Spaving between left value, the center line and the right values (does not affect centered pages)
x_buffer = 32;
//Updates on each page
start_y = 0;
start_x = 0;
//Is the mouse moving?
mouse_moving = false;

///Default things
depth -= 1;