/// @desc a stage has begun
timer = STAGE_TIMER.DEFAULT;//global.stage_timer;
enum STAGE_TIMER {
	DEFAULT = 90, DEDICATED = 120, SCARED = 180
}
timer_current = timer;
timer_room = 0;
wait_timer = 3;
wait_timer_current = room_speed + 10;
wait_timer_scale = 1;
global.play = false;