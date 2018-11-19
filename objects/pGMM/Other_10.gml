/// @desc Count down
if (timer_current > 0)
	timer_current--;
else if (enabled)
	global.play = false;