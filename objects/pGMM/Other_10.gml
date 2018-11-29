/// @desc Count down
if (timer_current > 0)
	timer_current--;
else if (enabled) {
	//Timer is 0, end the game
	event_user(1);	
}