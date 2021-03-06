/// @desc Animation/Sprite

//Buff draw handler
scBuffHandler(BUFF_EVENT.DRAW);

//Draw event for ultimates
scUltimateHandlerDraw();

//Combo draw
scComboDraw();

//Animate the player in their current state
var char_info = player_map[? PLAYER_MAP.CHARACTER_INFO];
scPalleteSwapSet(char_info[? CHARACTER_MAP.PALETTE], char_info[? CHARACTER_MAP.PALETTE_INDEX]);
scAnimationState();
scPalleteSwapReset();

//Moving dust
event_user(0);

//Show weapon clip if larger than 1
event_user(1);

//GAMEPAD DEBUGGING
event_user(2);

//Show players collision box while in debug mode
if (global.debug) {
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);
	scDrawText(bbox_left, bbox_top - 10, "HSP: " + string(hsp_move), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 25, "FACING: " + string(facing), noone, 0.3);
	/*scDrawText(bbox_left, bbox_top - 10, "Controller ID: " + string(controller), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 25, "Controller In Use: " + string(controller_inuse), noone, 0.3);
	scDrawText(bbox_left, bbox_top - 40, "Controller Last Used: " + string(controller_lastused), noone, 0.3);*/
}