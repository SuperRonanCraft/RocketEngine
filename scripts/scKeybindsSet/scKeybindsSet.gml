/// @desc Set the key binds to a specific player
/// @arg index-of-player

key_map = ds_map_create();
var map = key_map;

if (argument0 == KEYBIND_PLAYER.PLAYER1) {
	map[? KEYBIND_MAP.LEFT] = SETTINGS.PLAYER_1_LEFT;
	map[? KEYBIND_MAP.RIGHT] = SETTINGS.PLAYER_1_RIGHT;
	map[? KEYBIND_MAP.JUMP] = SETTINGS.PLAYER_1_JUMP;
	map[? KEYBIND_MAP.SHOOT] = SETTINGS.PLAYER_1_SHOOT;
	map[? KEYBIND_MAP.ABILITY] = SETTINGS.PLAYER_1_ABILITY;
	map[? KEYBIND_MAP.ULTIMATE] = SETTINGS.PLAYER_1_ULTIMATE;
	map[? KEYBIND_MAP.INVENTORY] = SETTINGS.PLAYER_1_INVENTORY;
	map[? KEYBIND_MAP.LEFT_GP] = SETTINGS.PLAYER_1_LEFT_GP;
	map[? KEYBIND_MAP.RIGHT_GP] = SETTINGS.PLAYER_1_RIGHT_GP;
	map[? KEYBIND_MAP.JUMP_GP] = SETTINGS.PLAYER_1_JUMP_GP;
	map[? KEYBIND_MAP.SHOOT_GP] = SETTINGS.PLAYER_1_SHOOT_GP;
	map[? KEYBIND_MAP.ABILITY_GP] = SETTINGS.PLAYER_1_ABILITY_GP;
	map[? KEYBIND_MAP.ULTIMATE_GP] = SETTINGS.PLAYER_1_ULTIMATE_GP;
	map[? KEYBIND_MAP.INVENTORY_GP] = SETTINGS.PLAYER_1_INVENTORY_GP;
	map[? KEYBIND_MAP.GAMEPAD] = SETTINGS.PLAYER_1_GAMEPAD;
} else if (argument0 == KEYBIND_PLAYER.PLAYER2) {
	map[? KEYBIND_MAP.LEFT] = SETTINGS.PLAYER_2_LEFT;
	map[? KEYBIND_MAP.RIGHT] = SETTINGS.PLAYER_2_RIGHT;
	map[? KEYBIND_MAP.JUMP] = SETTINGS.PLAYER_2_JUMP;
	map[? KEYBIND_MAP.SHOOT] = SETTINGS.PLAYER_2_SHOOT;
	map[? KEYBIND_MAP.ABILITY] = SETTINGS.PLAYER_2_ABILITY;
	map[? KEYBIND_MAP.ULTIMATE] = SETTINGS.PLAYER_2_ULTIMATE;
	map[? KEYBIND_MAP.INVENTORY] = SETTINGS.PLAYER_2_INVENTORY;
	map[? KEYBIND_MAP.LEFT_GP] = SETTINGS.PLAYER_2_LEFT_GP;
	map[? KEYBIND_MAP.RIGHT_GP] = SETTINGS.PLAYER_2_RIGHT_GP;
	map[? KEYBIND_MAP.JUMP_GP] = SETTINGS.PLAYER_2_JUMP_GP;
	map[? KEYBIND_MAP.SHOOT_GP] = SETTINGS.PLAYER_2_SHOOT_GP;
	map[? KEYBIND_MAP.ABILITY_GP] = SETTINGS.PLAYER_2_ABILITY_GP;
	map[? KEYBIND_MAP.ULTIMATE_GP] = SETTINGS.PLAYER_2_ULTIMATE_GP;
	map[? KEYBIND_MAP.INVENTORY_GP] = SETTINGS.PLAYER_2_INVENTORY_GP;
	map[? KEYBIND_MAP.GAMEPAD] = SETTINGS.PLAYER_2_GAMEPAD;
} else if (argument0 == KEYBIND_PLAYER.PLAYER3) {
	map[? KEYBIND_MAP.LEFT_GP] = SETTINGS.PLAYER_2_LEFT_GP;
	map[? KEYBIND_MAP.RIGHT_GP] = SETTINGS.PLAYER_2_RIGHT_GP;
	map[? KEYBIND_MAP.JUMP_GP] = SETTINGS.PLAYER_2_JUMP_GP;
	map[? KEYBIND_MAP.SHOOT_GP] = SETTINGS.PLAYER_2_SHOOT_GP;
	map[? KEYBIND_MAP.ABILITY_GP] = SETTINGS.PLAYER_2_ABILITY_GP;
	map[? KEYBIND_MAP.ULTIMATE_GP] = SETTINGS.PLAYER_2_ULTIMATE_GP;
	map[? KEYBIND_MAP.INVENTORY_GP] = SETTINGS.PLAYER_2_INVENTORY_GP;
	map[? KEYBIND_MAP.GAMEPAD] = SETTINGS.PLAYER_3_GAMEPAD;
} else if (argument0 == KEYBIND_PLAYER.PLAYER4) {
	map[? KEYBIND_MAP.LEFT_GP] = SETTINGS.PLAYER_2_LEFT_GP;
	map[? KEYBIND_MAP.RIGHT_GP] = SETTINGS.PLAYER_2_RIGHT_GP;
	map[? KEYBIND_MAP.JUMP_GP] = SETTINGS.PLAYER_2_JUMP_GP;
	map[? KEYBIND_MAP.SHOOT_GP] = SETTINGS.PLAYER_2_SHOOT_GP;
	map[? KEYBIND_MAP.ABILITY_GP] = SETTINGS.PLAYER_2_ABILITY_GP;
	map[? KEYBIND_MAP.ULTIMATE_GP] = SETTINGS.PLAYER_2_ULTIMATE_GP;
	map[? KEYBIND_MAP.INVENTORY_GP] = SETTINGS.PLAYER_2_INVENTORY_GP;
	map[? KEYBIND_MAP.GAMEPAD] = SETTINGS.PLAYER_4_GAMEPAD;
} else {
	map[? KEYBIND_MAP.GAMEPAD] = noone;
}
//controller = argument0;
keydirection = 1;
controller_inuse = false;
controller_lastused = false;
//Movement vars
controlling = 0; //If the player is controlling AND moving

key_left = false;
key_right = false;
key_jump = false;
key_jump_released = false;
key_shoot = false;
key_shoot_released = false;
key_ult = false;
key_ability = false;
key_inventory = false;

//Keybinds
enum KEYBIND_PLAYER {
	PLAYER1, PLAYER2, PLAYER3, PLAYER4, NONE
}

enum KEYBIND_MAP {
	LEFT, RIGHT, JUMP, SHOOT, ULTIMATE, ABILITY, INVENTORY,
	LEFT_GP, RIGHT_GP, JUMP_GP, SHOOT_GP, ULTIMATE_GP, ABILITY_GP, INVENTORY_GP, 
	GAMEPAD
}