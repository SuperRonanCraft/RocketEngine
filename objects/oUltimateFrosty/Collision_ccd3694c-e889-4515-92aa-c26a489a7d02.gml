/// @desc 
var dir = point_direction(other.x, other.y, x, y);
hsp += lengthdir_x(10, dir); //move faster
vsp -= 5; //launch up a tad
with (other)
	event_user(0);
hsp = clamp(hsp, -hsp_max, hsp_max);