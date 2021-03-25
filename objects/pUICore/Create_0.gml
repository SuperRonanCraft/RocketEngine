///Page types
enum menu_page {
	main, more_gamemodes, settings, audio, graphics, 
	//main keys
	keybinds, keybinds_1, keybinds_2, keybinds_controller,
	//keybinds2_1, keybinds2_2, 
	controls, info, confirm, modes, stats,
	//custom
	list_weapons, list_buffs, list_achievements, game_type, local, online,
	//Keep last
	height
}

///Kind of special elements
enum menu_element_type {
	//Run a script
	script_runner,
	//Go to another page (enum value)
	page_transfer,
	//Go to another page and run a script
	page_transfer_script,
	//Is a type of input
	slider,
	//Go from one value to another
	shift,
	//Go from one value to another and execute script
	shift_script,
	//Toggle from true <-> false
	toggle,
	//Toggle from true <-> false, without inputting
	toggle_live,
	//Takes a key input
	input,
	//Takes a key input, and caches
	keybind,
	//Go to a room
	goto_room,
	//List all weapon modifiers
	list_weapons, 
	//List all buffs
	list_buffs, 
	//Achivements
	list_achievements,
	//Toggle multiple settings
	mass_toggle,
	//Control type
	controls,
	//Stats type
	stats,
	//Gamepad Setting
	set_gamepad,
	//String
	input_string
}

enum menu_centered {
	left, right
}

///Menu settings
//The page we are on
page = 0;
//The option we have selected in a page (array)
menu_option = -1;
//All the pages we have loaded in a ui (array)
menu_pages = 0;
//The enum id of each page (array)
menu_pages_index = 0;
//All the pages we want centered (should only include 'script_runner', 'page_transfer' or 'goto_room' elements)
menu_pages_centered = 0;
//If we are inputting values 'input/keybind'
input = noone; //[page, index]
//If we have refreshed the values to global values, such as the keybinds, resolution and volume
checked = false;
//Enable manipulating the menu (must always be true by default)
control = true;
//Titles for a page (array)
menu_titles = noone;

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
//scale_comment = 0.45;
scale_element = 0.6;
scale_description = 0.45;
scale_description_special = 0.7; //Scale of a desc for character select
scale_option = noone; //An array of scales
scale_change = 0.05;

//Sizes
slider_width = 128; //Length of the sliders

//Colors
color_main = c_gray; //Button colors
color_main_hovering = c_orange;//global.menu_color_hover_act; //Button hovering colors
color_element = c_ltgray; //Element colors (desc or input)
color_element_input = c_yellow; //Inputting element color
color_element_hover = c_yellow; //Selected/editting this input
//color_element_input_unselected = c_black; //Inputting element unselected color (toggle)
color_element_special = c_gray; //Special element colors
color_seperator = c_black; //Seperator color

//Used for scaling and knowing if we should work on a new pages variables
page_workingon = noone; //The current page we have setup
centered = false; //Is the whole page centered?

//Custom Buttons
button_left = vk_left;
button_right = vk_right;
button_up = vk_up;
button_down = vk_down;
button_gamepad = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_GAMEPAD);
button_gamepad_only = false;

///Default things
depth -= 1;

//Titles
menu_titles = [[menu_page.graphics, "GRAPHICS"], [menu_page.keybinds, "KEYBINDS"],
	[menu_page.keybinds_1, "PLAYER 1"], [menu_page.keybinds_2, "PLAYER 2"],
	[menu_page.keybinds_controller, "CONTROLLERS"], [menu_page.settings, "SETTINGS"],
	[menu_page.audio, "AUDIO"], [menu_page.info, "EXTRAS"]];