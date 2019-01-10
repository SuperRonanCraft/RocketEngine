/// @description Insert description here
// You can write your code in this editor

if (first_draw) exit;
first_draw = true;

image_xscale = side == TEAM.LEFT ? 1 : -1;
x2 = side == TEAM.LEFT ? RES_W : 0; //Collision line