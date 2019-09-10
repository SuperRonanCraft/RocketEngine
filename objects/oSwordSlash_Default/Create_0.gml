/// @description  
owner = noone;

timer = 0;
trueTimer = -1;
oldOwner = noone;
oldOwner_time_dialation_adjust = 0;
time_dialation_adjust = 0;

hitList = ds_list_create();
confirmList = ds_list_create();

scPlaySound(SOUND.EFFECT_SLASH);
