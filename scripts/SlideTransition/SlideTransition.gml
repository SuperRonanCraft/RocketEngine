/// @desc SlideTransition(mode, targetRoom)
/// @arg Mode sets transition mode
/// @arg Target sets target room when using goto mode

with (oTransition) {
	pre_mode = mode;
	mode = argument[0];
	if (argument_count > 1)
		target = argument[1];
}