/// @description Insert description here
// You can write your code in this editor

if (first_draw) exit;
first_draw = true;

image_xscale = !owner.shoot_face ? (owner.team == TEAM.LEFT ? 1 : -1) : (owner.facing == 1 ? 1 : -1); //Side to point
x2 = owner.team == TEAM.LEFT ? room_width : 0; //Collision line side