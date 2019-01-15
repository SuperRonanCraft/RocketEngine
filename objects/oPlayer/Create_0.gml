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


//Health
hp = 10;
hp_original = hp;
hp_scale = 1;
hpsprite = sHealth;
hpheight = sprite_get_height(hpsprite);
hpwidth = sprite_get_width(hpsprite);
display = true; //Display gui stuff

//Show when hit
flash = 0;

//Load Rockets
scRocketStart(starting_weapon);

//Load Ultimates
scUltimateStart();

//Load Combos
scComboStart();

//Buffs/Debuffs setup
scBuffStart();


//Load player states
canControl = true;
playerState = PLAYERSTATE.NORMAL;

//Load animation states
alive = true;
animationVar = 0;
overrideAnimation = false;
currentSprite = sprite_index;
enum ANIMATIONSTATE {
	STANDING, RISING, FALLING, WALKING, DEAD, KNOCKBACK, KNOCKBACK2, TECHED,TRAPPED,
}

animState = ANIMATIONSTATE.STANDING;

//If jumped at right time
teched = false;