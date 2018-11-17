/// @desc Count down
timer_current--;
if (enabled && timer_current <= 0)
	global.play = false;