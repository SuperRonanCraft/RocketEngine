/// @description Animation/Sprite
// You can write your code in this editor

//Draws sprite with modified direction
draw_set_color(c_black);
draw_text(x, y - 30, string(playerid));
draw_text(x, y - 70, string(rockets));
draw_set_color(c_white);
scDirection();