///Page types
enum menu_page {
	main, gamemodes, more_gamemodes, settings, audio, graphics, keybinds,
	keybinds2, controls, info, rocketlist, rocketbuffs, confirm,
	//Keep last
	height
}

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
	//List all rockets
	rocket_list, rocket_buffs,
	//Controls page
	controls
}

enum menu_centered {
	left, right
}

///Menu settings
//The page we are on
page = 0;
//The option we have selected in a page (array)
menu_option = 0;
//All the pages we have loaded in a ui (array)
menu_pages = 0;
//The enum id of each page (array)
menu_pages_index = 0;
//All the pages we want centered (should only include 'script_runner', 'page_transfer' or 'goto_room' elements)
menu_pages_centered = 0;
//If we are inputting values 'slider', 'shift', 'toggle' or 'input')
inputting = false;
//If we have refreshed the values to global values, such as the keybinds, resolution and volume
checked = false;
//Enable manipulating the menu (must always be true by default)
control = true;

///Mouse control
mouse_x_old = device_mouse_x_to_gui(0);
mouse_y_old = device_mouse_y_to_gui(0);
//Spacing between buttons
y_buffer = 60;
//Spacing between left value, the center line and the right values (does not affect centered pages)
x_buffer = 32;
//Updates on each page
start_y = 0; //Array of buttons with corresponding xvalue
start_x = 0; //Array of buttons with corresponding yvalue
start_x_default = RES_W / 2;
start_y_default = RES_H / 2;
//Is the current menu unfolding? Will lock mouse control
unfolding = false;
button_confirmed = 0; //[Button id, page] used to animate when clicked
//Ignore specific menu elements from being selected
menu_special = 0; //Array of special menu elements (affects full page)
menu_special_start_y = 0; //Their custom starting y values
//Update keybinds for players?
keys_update = false;

//Scale types
scale_main = 1;
scale_main_hovering = 1.2;
scale_comment = 0.45;
scale_element = 0.6;
scale_description = 0.45;
scale_option = noone; //An array of scales
scale_change = 0.05;

//Sizes
slider_width = 128; //Length of the sliders

//Colors
color_main = c_gray; //Button colors
color_main_hovering = c_orange; //Button hovering colors
color_element = c_ltgray; //Element colors (desc or input)
color_element_input = c_yellow; //Inputting element color
color_element_input_unselected = c_black; //Inputting element unselected color (toggle)
color_element_special = c_gray; //Special element colors
color_seperator = c_black; //Seperator color

//Used for scaling and knowing if we should work on a new pages variables
page_workingon = noone; //The current page we have setup
centered = false; //Is the whole page centered?

///Default things
depth -= 1;