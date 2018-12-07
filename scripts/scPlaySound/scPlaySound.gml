/// @desc manage sounds, play a sound
/// @arg sound to play
/// @arg pitch* of sound
/// @arg cancel-sound* sound you would also like to cancel

var sound = argument[0];
if (sound != noone) {
	if (argument_count >= 2 && argument[1] != noone)
		audio_sound_pitch(sound, argument[1]);
	audio_play_sound(sound, 5, false);
}
//Cancel some sounds
if (argument_count >= 3 && argument[2] != noone) {
	var array = argument[2];
	for (var i = 0; i < array_length_1d(array); i++)
		audio_stop_sound(array[i]);
}

enum SOUND {
	//USER INTERFACE
		//Hovering over butto
	UI_HOVER = snHover,
		//Selected a button
	UI_SELECT = snSelect,
	//EFFECTS
		//Shoot rocket
	EFFECT_SHOOT = snShoot_Default,
		//Gotten hit by rocket
	EFFECT_HIT = noone,
		//Explosion sound
	EFFECT_EXP = noone,
		//Death effect
	EFFECT_DEATH = noone,
		//Hit a target
	EFFECT_TARGET_HIT = noone,
		//Hit a bomb
	EFFECT_TARGET_BOMB = noone,
		//Picked up a powerup
	EFFECT_PICKUP = noone,
		//Nuke explosion sound
	EFFECT_NUKE_EXP = noone,
	//GAMEPLAY
		//Game ended
	GP_ENDGAME = snEndGame,
	//MUSIC
	MUSIC_1 = snMusic1,
	MUSIC_2 = snMusic2,
	MUSIC_3 = snMusic3,
	MUSIC_4 = snMusic4,
	MUSIC_5 = snMusic5,
	MUSIC_6 = snMusic6,
	MUSIC_TITLE = snTitle,
	//ULTIMATES
	ULT_SHIELD_BREAK = snUltimateShieldBreak,
	ULT_SHIELD_CAST = snUltimateShieldCast
}