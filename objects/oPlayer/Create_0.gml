/// @desc Create

//Load up health
event_inherited();

//Load basic player variables
scPlayerStart();

//Load Ultimates
scUltimateStart();

//Load Character
scPlayerCharacterChange(scPlayerCharacterGet());

//Load gravity and movement variables
scGravityStart();

//Load keybinds
scKeybindsSet(keys);

//GUI
hp_scale = 1;
hpsprite = sHealth;
hpheight = sprite_get_height(hpsprite);
hpwidth = sprite_get_width(hpsprite);
hp_color = c_white;
hp_offset = 0;

//Load weapon
//scWeaponStart();

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
friction_base = 0.15;
friction_adj = 0;
recoilKB = 0;
recoilMAX = 0;

//If jumped at right time
//teched = false;

//Cause of death
causeOfDeath = noone;
animationDebounce = false;

//AI Control
player_aimode = false;
aiBrain = noone;

//Cheat mode buff id
buffs_cur = -1;
weapons_cur = 0;

//Smoke moving effect
smoke_cur = 0;
smoke_act = 10;
smoke_lastvsp = 0;