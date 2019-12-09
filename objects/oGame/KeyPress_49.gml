///@desc Quick 1v1 mode button
if (!global.debug) exit;
global.vol_master = 0;
//scUIChangeVolume(0, 0);
room_goto(r1v1Stage1);
if (global.pause)
	event_user(1);
