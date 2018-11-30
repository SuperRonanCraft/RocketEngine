if (!checked || !global.play) exit;
with (other)
	scChangeRocket(other.rocket);
if (destroy)
	instance_destroy();
//Pickup sound
//audio_play_sound(SOUND.EFFECTS_PICKUP, 5, false);