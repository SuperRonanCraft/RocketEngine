/// @description Insert description here
// You can write your code in this editor

if (first_draw) exit;
first_draw = true;

image_xscale = owner.team == TEAM.LEFT ? 1 : -1; //Side to point
x2 = owner.team == TEAM.LEFT ? room_width : 0; //Collision line side