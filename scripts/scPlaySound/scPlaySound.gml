/// @desc manage sounds, play a sound
/// @arg sound* to play
/// @arg pitch* of sound
/// @arg [cancel-sound]* sound you would like to cancel
/// @arg multiple* have multiple of the same sound be played?
function scPlaySound() {

	var sound = argument[0];
	var allow_multi = argument_count > 3 ? (argument[3] != noone ? argument[3] : true) : true;
	if (sound != noone) {
		var play = true;
		if (!allow_multi)
			if (audio_is_playing(sound))
				play = false;
		if (play) {
			if (argument_count > 1 && argument[1] != noone)
				audio_sound_pitch(sound, argument[1]);
			audio_play_sound(sound, 5, false);
		}
	}
	//Cancel some sounds
	if (argument_count > 2 && argument[2] != noone) {
		var array = argument[2];
		for (var i = 0; i < array_length(array); i++)
			audio_stop_sound(array[i]);
	}

	enum SOUND {
		//USER INTERFACE
			//Hovering over butto
		UI_HOVER = snHover,
			//Selected a button
		UI_SELECT = snSelect,
		//EFFECTS
			//Bite
		EFFECT_BITE = snBite,
		EFFECT_BITE_HIT = snBite_Hit,
			//Shoot rocket
		EFFECT_SHOOT = snRocketShoot,
			//Gotten hit by rocket
		EFFECT_HIT = noone,
			//Explosion sound
		EFFECT_EXP = snRocketExplosion,
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
			//Sword ult
		EFFECT_SLASH = snSwordSlash,
			//Reflect
		EFFECT_REFLECT = snSwordReflect,
			//Throw shuriken
		EFFECT_SHUR_THROW = snShurikenThrow,
			//Shuriken hit surface
		EFFECT_SHUR_WALL = snShurikenHit,
			//Shuriken hit player
		EFFECT_SHUR_PLAYER = snShurikenStrike,
			//Player Fall
		EFFECT_PLAYER_FALL = snFall,
			//Player Step
		EFFECT_PLAYER_STEP_1 = snPlayerStep1,
		EFFECT_PLAYER_STEP_2 = snPlayerStep2,
		EFFECT_PLAYER_JUMP = snJump2,
			//Player Tech
		EFFECT_PLAYER_TECH = noone,
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
		MUSICLEVEL_1 = snMusicLevel1,
		MUSIC_TITLE = snTitle,
		//ULTIMATES
		ULT_SHIELD_BREAK = snUltimateShieldBreak,
		ULT_SHIELD_CAST = snUltimateShieldCast,
		ULT_JUMPPAD_BOUNCE = snUltJumppad,
		ULT_TELEPORT_USE = snUltTeleport,
		//ACHIEVEMENTS
		ACH_WHOOSH = sn_ach_whoosh,
	}


}
