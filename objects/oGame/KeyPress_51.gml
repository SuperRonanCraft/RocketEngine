///@desc Quick Test mode button
if (!global.debug) exit;
//global.vol_master = 0;
//scUIChangeVolume(0, 0);
room_goto(rSingleStage1);
if (global.pause)
	event_user(1);