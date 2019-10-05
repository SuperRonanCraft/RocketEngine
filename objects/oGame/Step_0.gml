/// @desc Pause game when out of focus

for (var i = 0; i < ds_list_size(controllers); i++) //Controller Pause (Select)
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