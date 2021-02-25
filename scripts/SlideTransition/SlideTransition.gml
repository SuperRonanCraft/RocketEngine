/// @desc SlideTransition(mode, targetRoom)
/// @arg Mode sets transition mode
/// @arg Target sets target room when using goto mode
function SlideTransition() {

	with (oTransition) {
		pre_mode = mode;
		mode = argument[0];
		if (argument_count > 1)
			target = argument[1];
	}
	//show_debug_message("called " + string(argument[0]) + " " + string(random(10)));
}
