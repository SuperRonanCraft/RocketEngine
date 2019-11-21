toggled_audio = false;

//Players id
//global.players = 0;

//The resolution the game will run at
#macro RES_W 1600 //Cam 1024
#macro RES_H 900 //Cam 576
#macro TIME_SPEED (room_speed / 30)

changeres = true;

//Pausing
//Screenshot of all sprites before disabling them
background = noone;
global.pause = false;
global.pause_possible = true;
global.pause_onfocus = true;
global.gamemode_select = false; //Set to false every main menu load (sets to load up gamemode select not main page)

//Gamemodes
//Preset
enum GAMEMODE {
	ONEVONE, TARGETS, KNOCKOUT, SINGLE, RUMBLE, TUTORIAL, LENGTH
}
global.gamemodes[GAMEMODE.ONEVONE] = "One v One";
global.gamemodes[GAMEMODE.TARGETS] = "Targets";
global.gamemodes[GAMEMODE.KNOCKOUT] = "Knockout";
global.gamemodes[GAMEMODE.SINGLE] = "Single Player";
global.gamemodes[GAMEMODE.TUTORIAL] = "Tutorial";
global.gamemodes[GAMEMODE.RUMBLE] = "Rumble";
//Set when a select room is activated
global.gamemode = noone;
//Gamemode rooms
global.gamemodeSRoom[GAMEMODE.ONEVONE] = r1v1Select;
global.gamemodeSRoom[GAMEMODE.TARGETS] = rvTargetSelect;
global.gamemodeSRoom[GAMEMODE.KNOCKOUT] = rKnockOutSelect;
global.gamemodeSRoom[GAMEMODE.SINGLE] = rSingleSelect;
global.gamemodeSRoom[GAMEMODE.TUTORIAL] = rTutorial;
global.gamemodeSRoom[GAMEMODE.RUMBLE] = rRumbleSelect;
//Stages
//Set on every StageSelect room
global.stages = -1;
//Saved after a stage is selected to play
//global.stage_selected = -1;
global.play = true;

//Other
global.vol_master = 1;
global.vol_music = 0.15;
global.vol_sounds = 0.2;
global.fullscreen = false;
global.weapon_info = true;
//global.menu_color_hover = 0;
//global.menu_color_hover_act = c_orange;

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
//1V1
global.mode_1v1_preset = 1;
global.mode_1v1_health = 2;
global.mode_1v1_ultimates = 1; //Ability to use ultimates
global.mode_1v1_timer = 2; //Timer
global.mode_1v1_weapon = true; //Ability to use your weapon
global.mode_1v1_singleplayer = 0; //Multiplayer level

//TARGETS
global.mode_targets_preset = 1;
global.mode_targets_difficulty = 0;
global.mode_targets_timer = 2;

//KNOCKBACK
global.mode_kb_preset = 1;
//global.mode_kb_pickups = 1;
global.mode_kb_health = 2;
global.mode_kb_ultimates = 1;
global.mode_kb_timer = 2;

//RUMBLE
global.mode_rumble_preset = 1;
global.mode_rumble_health = 2;
global.mode_rumble_ultimates = 1;
global.mode_rumble_timer = 2;
global.mode_rumble_singleplayer = 0; //Multiplayer level

//STAGE SCORE
global.score_mode_p1_wins = 0;
global.score_mode_p2_wins = 0;

//Set default font
draw_set_font(fPixel);

//Pallete Stuff
scPalleteSwapStart(shPaletteSwap);

//Controller Support
global.setting_controller_error = true;
global.gamepad_error = false; //Do we have a gamepad error?
controllers = ds_list_create();

//PHYSICS TESTING! DISABLE TO RE-ENABLE NORMAL GAME
physics_debug = true;