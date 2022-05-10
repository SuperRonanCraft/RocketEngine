function scUIExitToGamemodeSelect() {
	global.gamemode_select = true;
	scUIExitToTitle();


}

function scUIExitToStageSelect() {
	scUIResumeGame();
	SlideTransition(TRANS_MODE.GOTO, global.gamemodeSRoom[global.gamemode]);
}
