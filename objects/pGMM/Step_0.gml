/// @desc Wait delay before starting stage, if allowed to play, call countdown delay every second
if (wait_timer > 0) {
	wait_timer_current--;
	if (wait_timer_current == 0) {
		wait_timer--;
		wait_timer_scale = 3;
		wait_timer_current = room_speed;
	}
	wait_timer_scale = max(wait_timer_scale * 0.95, 1);
	if (wait_timer == 0)
		global.play = true;
	exit;
} else if (global.play && !endgame) {
	if (timer_room <= 0) {
		timer_room = room_speed;
	} else 
		timer_room--;
	if (timer_room == 0)
		event_user(0);
}
//End of game event
if (endgame) {
	if (endgame_delay <= 0) {
		with (winner) {
			var scale = min(image_xscale + 0.05, 5);
			image_xscale = scale;
			image_yscale = scale;
			image_speed = 0;
		}
		with (loser) {
			var scale = min(image_xscale + 0.05, 5);
			image_xscale = scale;
			image_yscale = scale;
			image_speed = 0;
			//move_towards_point(RES_W / 2 + RES_W / 4, RES_H / 2, 2);
		}
		if (endgame_delay == 0) {
			global.play = false;
			endgame_delay--;
		}
	} else
		endgame_delay--;
}