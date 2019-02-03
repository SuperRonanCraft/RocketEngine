toggled_audio = false;

//Player 1 keybinds
global.key_p1_left = ord("A");
global.key_p1_right = ord("D");
global.key_p1_jump = ord("W");
global.key_p1_shoot = ord("S");

//Player 2 keybinds
global.key_p2_left = vk_left;
global.key_p2_right = vk_right;
global.key_p2_jump = vk_up;
global.key_p2_shoot = vk_down;

//Player 1 keybinds DEFAULT
global.key_p1_left_default = global.key_p1_left;
global.key_p1_right_default = global.key_p1_right;
global.key_p1_jump_default = global.key_p1_jump;
global.key_p1_shoot_default = global.key_p1_shoot;

//Player 2 keybinds DEFAULT
global.key_p2_left_default = global.key_p2_left;
global.key_p2_right_default = global.key_p2_right;
global.key_p2_jump_default = global.key_p2_jump;
global.key_p2_shoot_default = global.key_p2_shoot;

//Players id
//global.players = 0;

//The resolution the game will run at
#macro RES_W 1024
#macro RES_H 768

changeres = true;

//Pausing
//Screenshot of all sprites before disabling them
background = noone;
global.pause = false;
global.pause_possible = true;
global.pause_onfocus = true;

//Gamemodes
//Preset
enum GAMEMODE {
	ONEVONE, TARGETS, KNOCKOUT, RUMBLE, LENGTH
}
global.gamemodes[GAMEMODE.ONEVONE] = "One v One";
global.gamemodes[GAMEMODE.TARGETS] = "Targets";
global.gamemodes[GAMEMODE.KNOCKOUT] = "Knockout";
global.gamemodes[GAMEMODE.RUMBLE] = "Rumble";
//Set when a select room is activated
global.gamemode = noone;
//Gamemode rooms
global.gamemodeSRoom[GAMEMODE.ONEVONE] = r1v1Select;
global.gamemodeSRoom[GAMEMODE.TARGETS] = rvTargetSelect;
global.gamemodeSRoom[GAMEMODE.KNOCKOUT] = rKnockOutSelect;
global.gamemodeSRoom[GAMEMODE.RUMBLE] = rRumbleSelect;

//Stages
//Set on every StageSelect room
global.stages = -1;
//Saved after a stage is selected to play
global.stage_selected = -1;
global.play = true;

//Other
global.vol_master = 1;
global.vol_music = 0.15;
global.vol_sounds = 0.2;
global.fullscreen = false;

//Keybinds
enum KEYBIND {
	PLAYER1, PLAYER2, PLAYER3, PLAYER4
}

enum TEAM {
	NONE, LEFT, RIGHT
}

//Randomize gameplay
randomize();

//Different modes
devmode_allow = true; //Allow dev mode to function?
global.debug = false; //Debug mode?
global.devmode = false; //Developer mode enabled?

//Gameplay modes
global.mode_1v1_preset = 1
global.mode_1v1_pickups = 1;
global.mode_1v1_health = 2;
global.mode_1v1_ultimates = 1;
global.mode_1v1_timer = 2;
global.mode_1v1_rockets = true;
//global.mode_1v1_lowgravity = false;

global.mode_targets_preset = 1;
global.mode_targets_difficulty = 0;
global.mode_targets_rockettype = 1;
global.mode_targets_timer = 2;

global.mode_kb_preset = 1;
global.mode_kb_pickups = 1;
global.mode_kb_health = 2;
global.mode_kb_ultimates = 1;
global.mode_kb_timer = 2;

//STAGE SCORE
global.score_mode_p1_wins = 0;
global.score_mode_p2_wins = 0;

//LOAD STUFF
scLoadSettings();