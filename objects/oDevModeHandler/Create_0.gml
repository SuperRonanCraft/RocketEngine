/// @desc Dev Mode Debugger!
xx = RES_W / 2;
yy = 32;

with(oPlayer) //Aim at nearest player
	auto_aim = true;

tab = -1;
tab_y = RES_H / 4;
tab_w = 24;
tab_buf = 8;
alpha = 0.8;
tab_map = ds_map_create();