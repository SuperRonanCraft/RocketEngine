/// @desc manage sounds, play a sound
/// @arg sound to play

var sound = argument[0];
if (sound != noone) {
	if (argument_count > 1)
		audio_sound_pitch(sound, argument[1]);
	audio_play_sound(sound, 5, false);
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
	ULT_SHIELD_BREAK = noone
}