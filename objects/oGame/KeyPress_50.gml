///@desc Quick dev mode shotcut

if (!global.debug || room == devRoom) exit;

physics_debug = true;

//DISABLED SINGLEPLAYER SHORTCUT
/*if (!global.debug) exit;
global.vol_master = 0;
scUIChangeVolume(0, 0);
room_goto(rSingleSelect);
if (global.pause)
	event_user(1);*/