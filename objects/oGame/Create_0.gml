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

//Amount of player entities in the room
global.players = 0;

//Teams
global.team1 = ds_list_create();
global.team2 = ds_list_create();

//The resolution the game will run at
#macro RES_W 1024
#macro RES_H 768

changeres = true;

//Pausing
//Screenshot of all sprites before disabling them
background = noone;
global.pause = false;

//Gamemodes
//Preset
global.gamemodes[0] = "1v1";
global.gamemodes[1] = "vTarget";
global.gamemodes[2] = "KnockOut";
//Set when a gamemode is selected in oUIMain
global.gamemode = -1;

//Stages
//Set on every StageSelect room
global.stages = -1;
//Saved after a stage is selected to play
global.stage_selected = -1;
global.play = false;

//Other
global.vol_master = 1;
global.vol_music = 1;
global.vol_sounds = 1;
global.fullscreen = false;