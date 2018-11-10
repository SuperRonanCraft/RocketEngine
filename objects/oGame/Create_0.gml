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

global.player[0] = ds_map_create();