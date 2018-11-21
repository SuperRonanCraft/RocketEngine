/// @description Insert description here
// You can write your code in this editor

//parent shooter (player that shot)
parent = noone;
rocket_map = ds_map_create();

hitList = ds_list_create();
confirmList = ds_list_create();
image_angle = choose(0, 90, 180, 270);

//stepScript = noone;

//If it can hurt/affect the owner
//friendlyFire = false;
destroy = true;