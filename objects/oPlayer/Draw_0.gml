/// @desc Animation/Sprite

//Buff draw handler
scBuffHandler(BUFF_EVENT.DRAW);

//Draw event for ultimates
scUltimateHandlerDraw();

//Animate the player in their current state
scAnimationState();

//Moving dust
event_user(0);

//Show weapon clip if larger than 1
event_user(1);

//GAMEPAD DEBUGGING
event_user(2);

//Show players collision box while in debug mode
if (global.debug) {
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);
	//ANIMATION STATE
	scDrawText(bbox_left, bbox_top - 10, "HSP_MOVE: " + string(hsp_move), noone, 0.3);
	//PLAYER STATE
	scDrawText(bbox_left, bbox_top - 30, "HSP: " + string(hsp), noone, 0.3);
}