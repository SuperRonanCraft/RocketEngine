/// @desc start stage music
var sounds = 0;
sounds[0] = SOUND.MUSIC_1; sounds[1] = SOUND.MUSIC_2; sounds[2] = SOUND.MUSIC_3; sounds[3] = SOUND.MUSIC_4;
sounds[4] = SOUND.MUSIC_5; sounds[5] = SOUND.MUSIC_6;

//Make sure we dont play the same song again
var dontplay = noone;
for (var i = 0; i < array_length_1d(sounds); i++)
	if (audio_is_playing(sounds[i])) {
		dontplay = sounds[i];
		break;
	}
var sound = sounds[abs(random_range(0, 5))];
while (sound == dontplay)
	sound = sounds[abs(random_range(0, 5))];
audio_stop_all();
//Play the song
audio_play_sound(sound, 1000, true);
current_sound = sound;