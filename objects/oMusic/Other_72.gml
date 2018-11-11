/// @descr Sounds loaded
/*if (audio_group_is_loaded(agMusic)) {
	//audio_group_set_gain(agMusic, 0.1, false);
	if (!music)
		audio_play_sound(snTitle, 1000, true);
	music = true;
}

if (audio_group_is_loaded(agFootsteps)) {
	footsteps = true;
	audio_group_set_gain(agFootsteps, 1.0, false);
}*/

if (audio_group_is_loaded(agEffects))
	audio_group_set_gain(agEffects, 0.25, false);
