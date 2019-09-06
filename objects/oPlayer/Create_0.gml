/// @desc Create

//Load basic player variables
scPlayerStart();

//Load gravity and movement variables
scGravityStart();

//Load keybinds
scKeybindsSet(keys);

//Load up health
event_inherited();

//Load Sprites
scCharacterSprites();

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
hp_offset = 0;

//Load Rockets
scWeaponStart(WEAPON.SHRUKEN);

//Load Ultimates
scUltimateStart();

//Load Combos
scComboStart();

//Buffs/Debuffs setup
scBuffStart();

//Load player states
//canControl = true;
//playerState = PLAYERSTATE.NORMAL;

//Load animation states
//alive = true;
//animationVar = 0;
image_speed /= TIME_SPEED;
//overrideAnimation = false;
//currentSprite = sprite_index;

//animState = ANIMATIONSTATE.STANDING;

//Movement vars
controlling = 0; //If the player is controlling AND moving
friction_base = 0.2;
friction_adj = 0;
recoilKB = 0;
recoilMAX = 0;

//If jumped at right time
teched = false;

//Cause of death
causeOfDeath = noone;
animationDebounce = false;

//AI Control
player_aimode = false;
aiBrain = noone;

//Cheat mode buff id
buffs_cur = -1;

//Smoke moving effect
smoke_cur = 0;
smoke_act = 10;
smoke_lastvsp = 0;