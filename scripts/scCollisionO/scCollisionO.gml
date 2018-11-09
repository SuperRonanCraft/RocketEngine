/// @desc Object oWall Collision

//BUGS
//BUGS
//BUGS
/*
Standing on platform with both x and y speeds while changing directions will cause to teleport to the edge of platform

If platform is moving down and has horizontal speed, player just stays in same x pos

If standing and a platform comes in, you can get stuck
*/
//BUGS
//BUGS
//BUGS

var touching = instance_place(x, y + vsp, oWall); //get the instance of the wall in the future in the vertical

//The id of the object we stand on (noone default)
var standingOn = instance_place(x, y + vsp + 1, oWall);

if (touching != noone) { //If touching a wall in the vertical
	offset = 1;
	
	
	if (touching.moving){ //Offset the amount to deny moving into the next frame of the wall, owner should be (oPlatMoving)
		offset = touching.vsp;
		
		//Normal wall collision
		if (vsp > 0 && instance_place(x+hsp, y, oWall) == noone){ //Falling
			y = floor(touching.y - (bbox_bottom - y) - offset);
			standingOn = touching;
		}
		else if (vsp < 0 && touching.vsp > 0 &&  instance_place(x+hsp, y, oWall) != noone) //Going up
			y = ceil((touching.y + (touching.bbox_bottom - touching.y)) + (y - bbox_top) + offset);
	
		vsp = 0;		
		
	}
	
	else{
		
		//Normal wall collision
		if (vsp > 0){ //Falling
			y = floor(touching.y - (bbox_bottom - y) - offset);
		}
		else if (vsp < 0) //Going up
			y = ceil((touching.y + (touching.bbox_bottom - touching.y)) + (y - bbox_top) + offset);
	
		vsp = 0;
	}
	
}

if(standingOn != noone){
	if(standingOn.moving){
		//Move with the platform
		
		vsp += standingOn.vsp;	
	}
}

touching = instance_place(x + hsp, y, oWall); //get the instance of the wall in the future in the horizontal

//If touching a wall in the horizontal
if (touching != noone){ //If not touching a wall in the horizontal 
	var offset = 1;
	
	if (touching.moving) { //Check if touching a MOVING platform 
		offset = 1;
		
		
			
		if (hsp > 0)
			x = ceil(touching.x - (bbox_right - x) - offset);
		else if (hsp < 0)
			x = floor((touching.x + (touching.bbox_right - touching.x)) + (x - bbox_left) + offset);
			
			
		else {
			if (touching.hsp < 0) //Touching left and no hsp
				x = ceil(touching.x - (bbox_right - x) - offset);
			else if(touching.hsp > 0) //Touching right
				x = floor((touching.x + (touching.bbox_right - touching.x)) + (x - bbox_left) + offset);
		}
		hsp = 0;
	} 
	
	
	else {
		//Normal wall collision
		if (hsp > 0) //Right
			x = ceil(touching.x - (bbox_right - x) - offset);
		else if(hsp < 0)//Left
			x = floor((touching.x + (touching.bbox_right - touching.x)) + (x - bbox_left) + offset);
		hsp = 0;
	}
}

if(standingOn != noone){
	if(standingOn.moving){
		//Move with the platform
		
		hsp += standingOn.hsp;	
	}
}
	
//check to see if a wall is 1 pixel under (plus your vertical speed), then you are standing, and return that variable
return (standingOn != noone) ;