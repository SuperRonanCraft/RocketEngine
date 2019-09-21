/// @descr Sounds loaded

if (audio_group_is_loaded(agMusic)) {
	audio_group_set_gain(agMusic, global.vol_music, 0);
	var sound = SOUND.MUSIC_TITLE;
	audio_play_sound(sound, 1000, true);
	current_sound = sound;
}

if (audio_group_is_loaded(agEffects))
	audio_group_set_gain(agEffects, global.vol_sounds, 0);
