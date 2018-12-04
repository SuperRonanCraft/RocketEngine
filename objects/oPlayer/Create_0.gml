/// @desc Create
facing = 1;
//Id of the player

//Load gravity and movement variables
scGravityStart();
//Load keybinds
global.players[array_length_1d(global.players)] = self;
playerid = array_length_1d(global.players);
scKeybindsSet(keys);
//Load rocket
scRockets(starting_weapon);
//Display health
event_inherited();
//scTeamAdd(id, team);

//Load player states

canControl = true;
enum PLAYERSTATE{
	NORMAL,DEAD,
}
playerState = PLAYERSTATE.NORMAL;

//Load animation states
alive = true;
animationVar = 0;
overrideAnimation = false;
currentSprite = sprite_index;
enum ANIMATIONSTATE{
	STANDING,RISING,FALLING,WALKING,DEAD
}

animState = ANIMATIONSTATE.STANDING;

//Buffs/Debuffs
buffs = ds_list_create();