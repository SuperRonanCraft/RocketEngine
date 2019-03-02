/// @description  1v1 AI

//Player
player = noone;

//Keybinds
AIRight = false;
AILeft = false;
AIJump = false;
AIShoot = false;
AIUlt = false;

enum ACTIONS {
	RIGHT, LEFT, JUMP, SHOOT, ULT
}

//Random action
randDirection = choose(ACTIONS.RIGHT, ACTIONS.LEFT);

//Check Ultimate status
ultReady = false;

//Timer to react
timer = irandom_range(120, 300);