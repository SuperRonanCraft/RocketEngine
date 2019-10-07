/// @desc GUI for player hp, rockets and ults

//Buff draw handler (below all)
scBuffHandler(BUFF_EVENT.DRAW_GUI_BELOW);

if (display)
	scPlayerDrawIU();

//Buff draw handler (above all)
scBuffHandler(BUFF_EVENT.DRAW_GUI_ABOVE);