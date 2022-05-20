/// @description  1v1 AI

//Player
player = noone;

//Keybinds
AIRight = false;
AILeft = false;
AIJump = false;
AIShoot = false;
AIUlt = false;
AIAbility = false;

enum ACTIONS {
	RIGHT, LEFT, JUMP, SHOOT, ULT, ABILITY
}

//Random action
randDirection = choose(ACTIONS.RIGHT, ACTIONS.LEFT);

//Check Ultimate status
ultReady = false;

//movespeed
movesp = 0;

//Timer to react
timer = irandom_range(120, 300);

aiType = AI_TYPE.ONEVONE;
aiTarget = noone;

enable_last_known_coords = false;
last_known_x = 0;
last_known_y = 0;

enum AI_TYPE {
	ONEVONE, ZOMBIE, TEST, 
}