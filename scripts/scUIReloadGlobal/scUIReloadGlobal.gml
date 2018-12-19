/// @desc reload the global variables of a menu

if (checked) exit; //Do we need to check?

for (var a = 0; a < array_length_1d(menu_pages); a++) {
	var ds_g = menu_pages[a]; //Grab the grid
	for (var i = 0; i < ds_grid_height(ds_g); i++) {
		switch (ds_g[# 1, i]) { //Only update specific grids that have global variables
			case menu_element_type.slider:
			case menu_element_type.toggle: 
				ds_g[# 4, i] = variable_global_get(ds_g[# 3, i]);
				break;
			case menu_element_type.input: ds_g[# 3, i] = variable_global_get(ds_g[# 2, i]); break;
		}
	}
}
checked = true;