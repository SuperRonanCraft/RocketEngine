/// @desc 

// Inherit the parent event
event_inherited();

cam_size_x = RES_W;
cam_size_y = RES_H;
cam_size_x_last = cam_size_x;
cam_size_y_last = cam_size_y
/*
players = noone;

//Find and cache all players
var amt = instance_number(oPlayer);
for (var i = 0; i < amt; i++)
	players[0] = instance_find(oPlayer, i);