/// @desc Create

//Load gravity and movement variables
scGravityStart();
//Load keybinds
scKeybindsSet(keys);

//Display health
event_inherited();

//Health
hp = 10;
hp_original = hp;
hp_scale = 1;
hp_damaged = 0;
hpsprite = sHealth;
hpheight = sprite_get_height(hpsprite);
hpwidth = sprite_get_width(hpsprite);
//display = true; //Display gui stuff

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
	SLIDING,
}

animState = ANIMATIONSTATE.STANDING;

//Movement vars
controlling = 0; //If the player is controlling AND moving
friction_base = 0.3;
friction_adj = 0;

//If jumped at right time
teched = false;

//Cheat mode buff id
buffs_cur = -1;