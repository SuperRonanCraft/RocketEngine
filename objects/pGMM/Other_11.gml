/// @desc End the game (called from scHitShootable when a player hp <= 0) and when timer reaches 0
endgame = true;
//Delete all rockets in the game
with (oRocket)
	instance_destroy();
//End game sound...
//audio_play_sound(SOUND.GP_ENDGAME, 1, false);