/// @desc Object oWall Collision

var offset = 1;

if (hsp_knockback == 0)
	hsp = (hsp_override == 0) ? hsp_move + hsp_carry + hsp_knockback : hsp_override;
else
	hsp = hsp_knockback;
if (vsp_knockback == 0) //Make knockback override all inputs
	vsp = (vsp_override == 0) ? vsp_move + vsp_carry + vsp_knockback : vsp_override;
else
	vsp = vsp_move + vsp_knockback;

var touchingx = instance_place(x + hsp, y, oWall); //get the instance of the wall in the future in the horizontal
if (touchingx != noone){ //If touching a wall in the horizontal 
	//Normal wall collision
	if (hsp > 0) { //Going Right
		x = floor(touchingx.bbox_left + (x - bbox_right) - offset);
	} else if (hsp < 0)//Going Left
		x = ceil(touchingx.bbox_right + (x - bbox_left) + offset);
	
	hsp = 0;
	hsp_move = hsp;
	
	
	//Miss tech/bounce
	if(abs(hsp_knockback/2) < 7){
		hsp = 0;
		hsp_move = hsp;
		hsp_knockback = hsp;
	}
	else{
		part_particles_create(global.ParticleSystem1,x,y,oParticleHandler.ds_part[? PARTICLES.KBHIT],1);
		hsp_knockback /= -2;
		
		if(vsp_knockback >= 0){
			vsp_knockback = -5;
		}
	}
	
}

var touchingy = instance_place(x, y + vsp, oWall); //get the instance of the wall in the future in the vertical
if (touchingy != noone) { //If touching a wall in the vertical
	if (vsp > 0) //Falling
		y = floor(touchingy.bbox_top + (y - bbox_bottom) - offset);
	else if (vsp < 0) //Going up
		y = ceil(touchingy.bbox_bottom + (y - bbox_top) + offset);
	
	vsp = 0;
	vsp_move = vsp;
	vsp_knockback = vsp;
	
}

//check to see if a wall is 1 pixel under (plus your vertical speed), then you are standing, and return that variable
return (instance_place(x, y + offset, oWall) != noone);