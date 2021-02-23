function scStageRestart() {
	SlideTransition(TRANS_MODE.GOTO, room); //Transition to the room and restart
	control = false; //Remove menu control
	kick_execute = false; //Dont kick when timer just reached 0


}
