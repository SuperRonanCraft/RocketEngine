/// @desc Pause game when out of focus

//PHYSICS TESTING! DISABLE TO RE-ENABLE NORMAL GAME
if (physics_debug) {
	//if (room != rServer) {
	if (room != devRoom) {
		SlideTransition(TRANS_MODE.OFF);
		room_goto(devRoom);
		//room_goto(devRoom);
		//room_goto(rServer);
	} else {
		with (pGMM) {
			//instance_destroy();
			//wait_timer = 0;
			//wait_timer_current = 0;
			//wait_timer_current_abs = 1;
		}
		physics_debug = false;
		global.play = true;
		instance_create_depth(0, 0, depth - 1, oDevModeHandler);
	}
}

//Controller Pause (Select)
for (var i = 0; i < ds_list_size(controllers); i++)
	if (gamepad_button_check_pressed(controllers[| i], gp_start))
		event_user(0);

if (global.pause) exit;

if (global.pause_onfocus && os_is_paused()) { //Window is paused
	event_user(0); //Toggle pause
	audio_master_gain(0);
	toggled_audio = true;
} else if (toggled_audio) {
	audio_master_gain(global.vol_master);
	toggled_audio = false;
}