/// @desc End the game (called from scHitShootable when a player hp <= 0) and when timer reaches 0

//Triggered once
if (endgame) exit;

endgame = true;
//End game sound...
with (oMusic)
	event_user(2);