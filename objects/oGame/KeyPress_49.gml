global.vol_master = 0;
scUIChangeVolume(0, 0);
room_goto(r1v1Select);
if(global.pause)
	event_user(1);
