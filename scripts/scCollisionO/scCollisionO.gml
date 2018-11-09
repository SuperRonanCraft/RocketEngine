/// @desc Object oWall Collision

var touching = instance_place(x, y + vsp, oWall); //get the instance of the wall in the future in the vertical

//The id of the object we stand on (noone default)
var standingOn = noone;
var offset = 1;

if (touching != noone) { //If touching a wall in the vertical
	
	//Normal wall collision
	if (vsp > 0){ //Falling
		y = floor(touching.y - (bbox_bottom - y) - offset);
		standingOn = touching;
	}
	else if (vsp < 0) //Going up
		y = ceil((touching.y + (touching.bbox_bottom - touching.y)) + (y - bbox_top) + offset);
	vsp = 0;
	
}


touching = instance_place(x + hsp, y, oWall); //get the instance of the wall in the future in the horizontal



if (touching != noone){ //If touching a wall in the horizontal 
	//Normal wall collision
	if (hsp > 0) //Right
		x = ceil(touching.x - (bbox_right - x) - offset);
	else if(hsp < 0)//Left
		x = floor((touching.x + (touching.bbox_right - touching.x)) + (x - bbox_left) + offset);
	hsp = 0;
	
}
	
//check to see if a wall is 1 pixel under (plus your vertical speed), then you are standing, and return that variable
standingOn = instance_place(x, y + vsp + 1, oWall);
return (standingOn != noone) ;