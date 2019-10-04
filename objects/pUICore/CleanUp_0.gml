/// @desc clean up mem
for (var i = 0; i < array_length_1d(menu_pages); i++) {
	show_debug_message(i);
	ds_grid_destroy(menu_pages[i]);
}