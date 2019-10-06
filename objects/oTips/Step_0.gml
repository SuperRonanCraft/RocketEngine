/// @desc count down timer

if (not_enabled) //Notifications
	if (not_timer_cur > 0) {
		not_alpha = clamp(not_alpha + alpha_change, 0, 1);
		not_timer_cur--;
	} else {
		not_alpha = clamp(not_alpha - alpha_change, 0, 1);
		if (not_alpha <= 0) {
			ds_list_delete(not_text, 0);
			if (ds_list_size(not_text) == 0)
				not_enabled = false;
			else
				not_timer_cur = not_timer;
		}
	}

if (global.play && alpha <= 0) exit; //Disabled, just exit
else if (tip_delay_current > 0) { //Count down the delay, exit out
	tip_delay_current--;
	exit;
}

tip_timer_frames--;
if (tip_timer_frames <= 0) {
	tip_timer_current--;
	if (tip_timer_current <= 0) {
		if (alpha > 0) //Fade away
			alpha = max(alpha - alpha_change, 0);
	} else
		tip_timer_frames = room_speed;
} else
	alpha = min(alpha + alpha_change, 0.8); //Fade in

if (tip_timer_current <= 0 && alpha <= 0) { //Change tip
	if (!tip_enabled) {tip_delay_current = tip_delay; tip_enabled = true; exit;} //Restart the delay
	tip_timer_frames = room_speed;
	tip_timer_current = tip_timer;
	var current = tip_current;
	while (tip_current == current)
		tip_current = irandom_range(0, ds_grid_height(tip_list) - 1);
}