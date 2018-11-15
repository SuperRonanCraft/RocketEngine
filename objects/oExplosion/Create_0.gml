/// @description Insert description here
// You can write your code in this editor

size = 0;

//parent shooer (player that shot)
parent = noone;

hitList = ds_list_create();
confirmList = ds_list_create();

stepScript = noone;

//If it can hurt/affect the owner
friendlyFire = false;