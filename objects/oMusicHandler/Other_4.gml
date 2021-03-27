/// @desc Play music per room
//if (!sound_started) exit;
if (room == rMenu) {
	if (!audio_is_playing(snTitle)) {
		audio_stop_all();
		var sound = SOUND.MUSIC_TITLE;
		audio_sound_gain(sound, 0, 0);
		audio_play_sound(sound, 1000, true);
		audio_sound_gain(sound, global.vol_master * global.vol_music, 2000);
		current_sound = sound;
	}
} else if (audio_sound_get_gain(current_sound) != global.vol_music)
	audio_sound_gain(current_sound, global.vol_music, 500);
alreadypausing = false;
play_endgame = false;
play_endgame_playing = false;