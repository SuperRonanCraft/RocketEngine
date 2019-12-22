/// @desc Dev Mode Debugger!
xx = RES_W / 2;
yy = 32;


//SETTINGS
tab_open = true;
//tab_preview_players = true

//Tabs
tab_dragging = noone;
tab = -1;
tab_y = RES_H / 4;
tab_w = 24;
tab_buf = 8;
alpha = 0.8;
tab_color = c_dkgray;
tab_color_hover = c_white;
tab_color_select = c_ltgray;
tab_map = ds_map_create();

//Defaults
tab_map[? "players"] = noone;
tab_map[? "apply"] = false;