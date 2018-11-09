if (changeres && keyboard_check(ord("F"))) {
	window_set_fullscreen(!window_get_fullscreen());
	changeres = false;
}