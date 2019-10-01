/// @description Insert description here
// You can write your code in this editor

//parent shooter (player that shot)
parent = noone;
weapon_map = ds_map_create();

hitList = ds_list_create();
confirmList = ds_list_create();
//image_angle = choose(0, 180, 90, 270);

//If it can hurt/affect the owner
//friendlyFire = false;
destroy = true;
//Do damage while explosion animation is going on
doing_damage = true;

first_step = false;
first_draw = false;

deathCause = noone;