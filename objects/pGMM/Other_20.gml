/// @desc Pause Game Event
wait_timer = 3; //The original timer
wait_timer_current = wait_timer; //Current timer index
wait_timer_current_abs = room_speed + 10;
wait_timer_scale = 3;
wait_timer_text = string(wait_timer); //Current wait timer to display every second
wait_timer_color = c_red;
global.play = false;