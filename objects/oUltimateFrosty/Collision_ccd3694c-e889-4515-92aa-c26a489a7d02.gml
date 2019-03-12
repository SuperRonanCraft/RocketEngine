/// @desc 
var dir = point_direction(other.x, other.y, x, y);
hsp += (dir > 90 && dir < 270 ? -1 : 1) * 10; //move faster
with (other)
	event_user(0);
hsp = clamp(hsp, -hsp_max, hsp_max);