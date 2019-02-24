/// @desc Create

//Load gravity and movement variables
scGravityStart();
//Load keybinds
scKeybindsSet(keys);

//Display health
event_inherited();

//Health
hp = 20;
hp_original = hp;
hp_scale = 1;
hp_damaged = 0; //Amount of damage taken last time
hpsprite = sHealth;
hpheight = sprite_get_height(hpsprite);
hpwidth = sprite_get_width(hpsprite);
hp_flash_alpha = 0;
hp_flash_reduce = 0.05 / TIME_SPEED;
hp_flash_color = c_red;
hp_color = c_white;
//display = true; //Display gui stuff

//Show when hit
flash_alpha = 0; //Flashing alpha
flash_reduce = 0.05; //How much to reduce the flash alpha
flash_color = c_white; //Color of the flash

//Ult ready animation
ult_loc_x = 0;
ult_loc_y = 0;
ult_justReady = false;
ult_loc_timer = 2 * room_speed;
ult_loc_timer_cur = 0;
ult_loc_alpha = 0;
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
image_speed /= TIME_SPEED;
overrideAnimation = false;
currentSprite = sprite_index;
enum ANIMATIONSTATE {
	STANDING, RISING, FALLING, WALKING, DEAD, KNOCKBACK, KNOCKBACK2, TECHED,TRAPPED,
	SLIDING, SLEEPING, WAKING, DEAD2
}

animState = ANIMATIONSTATE.STANDING;

//Movement vars
controlling = 0; //If the player is controlling AND moving
friction_base = 0.6;
friction_adj = 0;
recoilKB = 0;
recoilMAX = 0;

//If jumped at right time
teched = false;

//AI Control
aiBrain = noone;

//Cheat mode buff id
buffs_cur = -1;

//Smoke moving effect
smoke_cur = 0;
smoke_act = 10;
smoke_lastvsp = 0;