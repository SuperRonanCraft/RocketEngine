/// @desc Create

//Load up health
event_inherited();

//Load gravity and movement variables
scGravityStart();

//Buffs/Debuffs setup
scBuffStart();

//Image speed related to forced FPS
image_speed = 0.8/TIME_SPEED;

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

destroy = false;
createCorpse = false;
//Aim type
//auto_aim = false;