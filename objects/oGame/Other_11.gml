/// @desc Unpause
if (!global.pause_possible) exit;
SlideTransition(TRANS_MODE.UNPAUSE);
sprite_delete(background);
background = noone;
if (!global.network_connected)
	instance_activate_all();
global.pause = false;