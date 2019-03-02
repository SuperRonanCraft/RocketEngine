/// @desc 

if (!global.play) exit; //Dont start unless game has started

if (timer_current <= 0) {
	item = sHealth;
	timer_current = -1;
} else if (timer_current > 0)
	timer_current--;