if (global.pause)
	event_inherited();
else if (checked) { //Unpaused
	page = menu_pages_index[menu_page.main]; //Reset the page
	checked = false; //Make it check its global vars when paused
}
