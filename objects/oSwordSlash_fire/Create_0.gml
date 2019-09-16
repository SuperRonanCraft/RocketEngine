/// @description  
owner = noone;

timer = 0;
trueTimer = -1;
oldOwner = noone;
schwing = false;

hitList = ds_list_create();
confirmList = ds_list_create();


scPlaySound(SOUND.EFFECT_SLASH);
