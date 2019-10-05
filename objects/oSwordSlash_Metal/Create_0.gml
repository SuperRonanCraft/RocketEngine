/// @description  
owner = noone;

trueTimer = -1;
oldOwner = noone;
schwing = false;

hitList = ds_list_create();
confirmList = ds_list_create();

scPlaySound(SOUND.EFFECT_SLASH);

//Sprite after sword swing
sprite_proj = sShuriken_Metal_Ult;
hsp = 0;