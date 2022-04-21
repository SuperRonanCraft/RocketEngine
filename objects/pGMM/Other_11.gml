/// @desc End the game (called from scHitShootable when a player hp <= 0) and when timer reaches 0

//Triggered once
if (endgame || room == devRoom) exit;

endgame = true;
//End game sound...
with (oMusicHandler)
	event_user(2);