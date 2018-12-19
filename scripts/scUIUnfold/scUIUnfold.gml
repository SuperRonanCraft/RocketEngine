/// @desc unfolding main page

if (!unfolding) exit; //We unfolding the menu, no? Exit

if (menu_pages_index[page] != menu_page.main) {unfolding = false; exit;} //We on the main page?

var btns = ds_grid_height(menu_pages[page]);
if (unfold[btns - 1] != 1) {
	var i = 0;
	repeat (btns) {
		if (unfold[i] == 1) i++;
		if (i < btns) unfold[i] = min(1, unfold[i] + 0.025);
		if (i + 1 < btns) unfold[i + 1] = min(1, unfold[i + 1] + 0.01);
	}
	unfolding = true;
} else { //Stop the event and allow mouse control
	unfolding = false;
	if (menu_option[page] == -1) menu_option[page] = 0;
}