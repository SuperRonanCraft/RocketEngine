/// @desc Count down
if (global.devmode || room == rPartyStart) exit;
if (timer_current > 0)
	timer_current--;
else
	//Timer is 0, end the game
	event_user(1);	