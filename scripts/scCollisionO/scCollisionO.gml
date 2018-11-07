/// @desc Object oWall Collision

var touching = instance_place(x + hsp, y, oWall); //Instance of wall touching

//If touching a wall in the horizontal
if (touching != noone) {
	if (hsp > 0)
		x = ceil(touching.x - (bbox_right - x) - 1);
	else if (hsp < 0)
		x = floor((touching.x + (touching.bbox_right - touching.x)) + (x - bbox_left) + 1);
	hsp = 0;
}

touching = instance_place(x, y + vsp, oWall);
//If touching a wall in the vertical
if (touching != noone) {
	if (vsp > 0) {
		y = floor(touching.y - (bbox_bottom - y) - 1);
		grounded = true;
	} else if (vsp < 0)
		y = ceil((touching.y + (touching.bbox_bottom - touching.y)) + (y - bbox_top) + 1);
	vsp = 0;
}
	
return place_meeting(x, y + 1, oWall);