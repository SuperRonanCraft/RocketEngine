if (wait_timer > 0) {
	wait_timer_current--;
	if (wait_timer_current == 0) {
		wait_timer--;
		wait_timer_scale = 2;
		wait_timer_current = room_speed;
	}
	wait_timer_scale = max(wait_timer_scale * 0.95, 1);
	if (wait_timer == 0)
		global.play = true;
	exit;
} else if (global.play) {
	if (timer_room <= 0) {
		timer_room = room_speed;
	} else 
		timer_room--;
	if (timer_room == 0)
		event_user(0);
}