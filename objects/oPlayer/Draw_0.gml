/// @description Animation/Sprite
// You can write your code in this editor

//Draws sprite with modified direction
draw_set_color(c_black);
draw_text(x, y - 60, string(playerid));
draw_text(x, y - 90, string(rockets));
draw_set_color(c_white);
event_inherited();