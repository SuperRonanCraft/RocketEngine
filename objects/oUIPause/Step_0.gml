if (global.pause)
	event_inherited();
else if (checked) { //Unpaused
	page = menu_pages_index[menu_page.main]; //Reset the page
	event_user(2); //Update keybinds
	checked = false; //Make it check its global vars when paused again
}
