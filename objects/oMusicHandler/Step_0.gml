/// @desc paused game

if (play_endgame) {
	audio_sound_gain(current_sound, global.vol_music / 10, 500);
	audio_play_sound(SOUND.GP_ENDGAME, 100, false);
	play_endgame = false;
	play_endgame_playing = true;
} else if (play_endgame_playing)
	if (!audio_is_playing(SOUND.GP_ENDGAME)) {
		audio_sound_gain(current_sound, global.vol_music, 500);
		play_endgame_playing = false;
	}
if (global.pause) {
	if (!alreadypausing && current_sound != noone) {
		audio_sound_gain(current_sound, 0.1 * global.vol_music, 500);
		alreadypausing = true;
	}
} else if (alreadypausing) {
	audio_sound_gain(current_sound, global.vol_music, 500);
	alreadypausing = false;
}
	
	