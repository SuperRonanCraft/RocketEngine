///@desc Fullscreeen
if (changeres && keyboard_check(ord("F"))) {
	window_set_fullscreen(!window_get_fullscreen());
	changeres = false;
	global.fullscreen = window_get_fullscreen();
	with (pUICore)
		checked = false;
}