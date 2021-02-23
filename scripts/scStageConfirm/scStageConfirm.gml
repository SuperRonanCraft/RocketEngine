/// @desc Select the stage and goto it
function scStageConfirm() {

	control = false; //Remove control from menu
	var wp_map = global.stages[stage_on];
	SlideTransition(TRANS_MODE.GOTO, wp_map[? "stage"]);
	global.pause_possible = false; //Dont allow pausing


}
