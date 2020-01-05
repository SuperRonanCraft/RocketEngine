/// @desc 

if (stuck || !moving) exit; //stuck to a wall?

var offset = 1;
if (instance_place(x, y + (offset + grv), oWall) == noone)
	vsp_real = clamp(vsp_real + (grv * time_dialation), -32, 32);
else
	hsp_real = lerp(hsp_real, 0, friction_base / friction_offset);

hsp = hsp_real * time_dialation;
vsp = vsp_real * time_dialation;

var touchingx = instance_place(x + hsp, y, oWall); //get the instance of the wall in the future in the horizontal
if (touchingx != noone) { //If touching a wall in the horizontal 
	//Normal wall collision
	if (hsp > 0) //Going Right
		x = floor(touchingx.bbox_left + (x - bbox_right) - offset);
	else if (hsp < 0) //Going Left
		x = ceil(touchingx.bbox_right + (x - bbox_left) + offset);
	
	hsp = (hsp * weight) * -1 * bounce_coeff; //bounce
	hsp_real = hsp;
}

var touchingy = instance_place(x, y + vsp, oWall); //get the instance of the wall in the future in the vertical
if (touchingy != noone) { //If touching a wall in the vertical
	if (vsp > 0) //Falling
		y = floor(touchingy.bbox_top + (y - bbox_bottom) - offset);
	else if (vsp < 0) //Going up
		y = ceil(touchingy.bbox_bottom + (y - bbox_top) + offset);
	
	vsp = (vsp * weight) * -1 * bounce_coeff; //bounce
	vsp_real = vsp;
}

if (touchingx != noone || touchingy != noone && sticky) //Hit a wall? Get stuck maybe?
	stuck = random(1) < stuck_chance;

//Rotate if moving
if (rotate && hsp != 0)
	angle += hsp;


if (stuck) exit;
//Start moving
x += hsp;
y += vsp;

if (touchingy != noone && abs(vsp) < 3)
	vsp_real = 0;

if (abs(hsp) <= 0.1 && abs(vsp) <= 0.1)
	moving = false;