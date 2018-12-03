/// @description Restart music
if (!audio_is_playing(snTitle))
	audio_play_sound(snTitle, 1000, true);