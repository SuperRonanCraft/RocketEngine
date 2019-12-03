/// @desc Pause
if (!global.pause_possible) exit;
SlideTransition(TRANS_MODE.PAUSE);
if (!global.network_connected) {
	background = sprite_create_from_surface(application_surface, 0, 0, RES_W, RES_H, false, false, 0, 0);
	if (instance_exists(pGMM))
		with (pGMM)
			event_user(10);
	instance_deactivate_all(true);
	instance_activate_object(oUIGamepadLost);
	instance_activate_object(oTransition);
	instance_activate_object(oUIPause);
	instance_activate_object(oMusicHandler);
	instance_activate_object(oTips);
	instance_activate_object(oSettingsHandler);
}
global.pause = true;