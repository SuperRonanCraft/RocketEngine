/// @descr Sounds loaded


if (audio_group_is_loaded(agMusic)) {
	var sound = SOUND.MUSIC_TITLE;
	audio_sound_gain(sound, 0, 0);
	audio_play_sound(sound, 1000, true);
	audio_sound_gain(sound, 1, 2000);
	current_sound = sound;
}

//Uncomment to enable the Footsteps audio ground
/*
if (audio_group_is_loaded(agFootsteps)) {
	footsteps = true;
	audio_group_set_gain(agFootsteps, 1.0, false);
}
*/

/*
if (audio_group_is_loaded(agEffects))
	audio_group_set_gain(agEffects, 0.25, false);*/
