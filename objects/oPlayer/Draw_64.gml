/// @desc GUI for player hp, rockets and ults

if(draw_health) exit;

//Buff draw handler (below all)
scBuffHandler(BUFF_EVENT.DRAW_GUI_BELOW);

//if (display)
//	scPlayerDrawIU();

//Buff draw handler (above all)
scBuffHandler(BUFF_EVENT.DRAW_GUI_ABOVE);

if (global.debug && object_index == oPlayer) {
	scDrawText(10, 120, "HSP MOVE: " + string(gravity_map[? GRAVITY_MAP.HSP_MOVE]), noone, 0.3, noone, noone, fa_left, fa_top);
	scDrawText(10, 140, "HSP MOD: " + string(gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD]), noone, 0.3, noone, noone, fa_left, fa_top);
}