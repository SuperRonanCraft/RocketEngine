/// @desc Create

//Load up health
event_inherited();

//Load basic player variables
scPlayerStart();

//Load Ultimates
scUltimateStart();

//Load Character
scPlayerCharacterChange(character, load_character_cache);

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

//Load Combos
scComboStart();

//Buffs/Debuffs setup
scBuffStart();

//Image speed related to forced FPS
image_speed /= TIME_SPEED;

//Movement vars
controlling = 0; //If the player is controlling AND moving

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

//Aim type
auto_aim = false;