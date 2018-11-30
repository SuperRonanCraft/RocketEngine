if (!checked || !global.play) exit;
show_debug_message("BUFFING!");
scAddBuff(buff, other);
if (destroy)
	instance_destroy();
//Pickup sound
//audio_play_sound(SOUND.EFFECTS_PICKUP, 5, false);