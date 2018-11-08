/// @desc Object oWall Collision

//BUGS
//BUGS
//BUGS
/*
Jumping under a platform and moving sideways, as its going down, will teleport the player to the side of the platform (side opposite of players hsp)

No testing has been done on hozizontaly moving platforms

If standing and a platform comes in, you can get stuck
*/
//BUGS
//BUGS
//BUGS

//var grounded = false;
var touching = instance_place(x + hsp, y, oWall); //get the instance of the wall in the future in the horizontal

//If touching a wall in the horizontal
if (touching != noone) //If not touching a wall in the horizontal
	if (hsp != 0) { //Skip if no momentum
		if (touching.owner != noone) { //Check if touching a platform (owner SHOULD be oPlatMoving)
			if (bbox_bottom > touching.bbox_top && bbox_bottom < touching.bbox_bottom) { //Check if touching side of wall
				if (hsp > 0)
					x = ceil(touching.x - (bbox_right - x) - 1);
				else
					x = floor((touching.x + (touching.bbox_right - touching.x)) + (x - bbox_left) + 1);
				hsp = 0;
				show_debug_message("TOUCHING SIDE OF PLATFORM");
			}
		} else {
			//Normal wall collision
			if (hsp > 0) //Right
				x = ceil(touching.x - (bbox_right - x) - 1);
			else //Left
				x = floor((touching.x + (touching.bbox_right - touching.x)) + (x - bbox_left) + 1);
			hsp = 0;
		}
	}

touching = instance_place(x, y + vsp, oWall); //get the instance of the wall in the future in the vertical
if (touching != noone) { //If touching a wall in the vertical
	//Cannot skip if no momentum incase of a moving wall
	var offset = 1;
	if (touching.owner != noone) //Offset the amount to deny moving into the next frame of the wall, owner should be (oPlatMoving)
		offset = -touching.owner.y_speed + sign(touching.owner.y_speed);
	else if (vsp < 0)
		offset = -1;
	//Normal wall collision
	if (vsp > 0) //Falling
		y = floor(touching.y - (bbox_bottom - y) - offset);
	else if (vsp < 0) //Going up
		y = ceil((touching.y + (touching.bbox_bottom - touching.y)) + (y - bbox_top) - offset);
	vsp = 0;
}
	
//check to see if a wall is 1 pixel under, then you are standing, and return that variable
return (instance_place(x, y + 1, oWall) != noone) ;