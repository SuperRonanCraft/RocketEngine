/// @desc reset timer and randomize when its re-enabled

//Start fading
tip_timer_frames = 0;
tip_timer_current = 0;

tip_enabled = false; //Restart the timer when alpha reaches 0
/*tip_timer_current = tip_timer; //Reset timer to change tip
tip_delay_current = tip_delay; //Reset tip delay
/*alpha = 0;
/*var current = tip_current;
while (tip_current == current)
	tip_current = irandom_range(0, ds_grid_height(tip_list) - 1);*/