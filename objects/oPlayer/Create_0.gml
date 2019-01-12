/// @desc Create
facing = 1;
//Id of the player

//Load gravity and movement variables
scGravityStart();
//Load keybinds
global.players[array_length_1d(global.players)] = self;
playerid = array_length_1d(global.players);
scKeybindsSet(keys);

//Display health
event_inherited();

//Load player states
canControl = true;
playerState = PLAYERSTATE.NORMAL;

//Load animation states
alive = true;
animationVar = 0;
overrideAnimation = false;
currentSprite = sprite_index;
enum ANIMATIONSTATE {
	STANDING, RISING, FALLING, WALKING, DEAD, KNOCKBACK, KNOCKBACK2, TECHED,
}

animState = ANIMATIONSTATE.STANDING;

//If jumped at right time
teched = false;