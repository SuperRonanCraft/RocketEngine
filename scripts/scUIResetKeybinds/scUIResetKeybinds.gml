/// @desc Resets all players keybinds

var keys = [SETTINGS.PLAYER_1_LEFT, 
			SETTINGS.PLAYER_1_RIGHT, 
			SETTINGS.PLAYER_1_JUMP, 
			SETTINGS.PLAYER_1_SHOOT, 
			SETTINGS.PLAYER_1_ULTIMATE, 
			SETTINGS.PLAYER_1_ABILITY,
			SETTINGS.PLAYER_2_LEFT, 
			SETTINGS.PLAYER_2_RIGHT, 
			SETTINGS.PLAYER_2_JUMP, 
			SETTINGS.PLAYER_2_SHOOT, 
			SETTINGS.PLAYER_2_ULTIMATE, 
			SETTINGS.PLAYER_2_ABILITY];

for (var i = 0; i < array_length_1d(keys); i++)
	scSettingsCache(keys[i], scSettingsGetType(SETTINGS_TYPE.DEFAULT, keys[i]));

/*//Player 2 keybinds
global.key_p1_left = global.key_p1_left_default;
global.key_p1_right = global.key_p1_right_default;
global.key_p1_jump = global.key_p1_jump_default;
global.key_p1_shoot = global.key_p1_shoot_default

//Player 2 keybinds
global.key_p2_left = global.key_p2_left_default;
global.key_p2_right = global.key_p2_right_default;
global.key_p2_jump = global.key_p2_jump_default;
global.key_p2_shoot = global.key_p2_shoot_default;*/

checked = false;
keys_update = true; //Reset the keys when unpaused