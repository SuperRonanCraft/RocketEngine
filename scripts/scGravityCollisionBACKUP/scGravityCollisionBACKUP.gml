/// @desc Object oWall Collision

var offset = 1;
var map = gravity_map;

//Knockback
if (map[? GRAVITY_MAP.HSP_KNOCKBACK] == 0)
	map[? GRAVITY_MAP.HSP] = map[? GRAVITY_MAP.HSP_MOVE] + map[? GRAVITY_MAP.HSP_PUSH];
else
	map[? GRAVITY_MAP.HSP] = map[? GRAVITY_MAP.HSP_KNOCKBACK] + map[? GRAVITY_MAP.HSP_MOVE];
if (map[? GRAVITY_MAP.VSP_KNOCKBACK] == 0)
	map[? GRAVITY_MAP.VSP] = map[? GRAVITY_MAP.VSP_MOVE] + map[? GRAVITY_MAP.VSP_PUSH];
else
	map[? GRAVITY_MAP.VSP] = map[? GRAVITY_MAP.VSP_KNOCKBACK] * grv_dir + map[? GRAVITY_MAP.VSP_MOVE];

map[? GRAVITY_MAP.HSP] *= time_dialation;
map[? GRAVITY_MAP.VSP] *= time_dialation;

var touchingx = instance_place(x + map[? GRAVITY_MAP.HSP], y, oWall); //get the instance of the wall in the future in the horizontal
if (touchingx != noone) { //If touching a wall in the horizontal 
	//Normal wall collision
	if (map[? GRAVITY_MAP.HSP] > 0) //Going Right
		x = floor(touchingx.bbox_left + (x - bbox_right) - offset);
	else if (map[? GRAVITY_MAP.HSP] < 0) //Going Left
		x = ceil(touchingx.bbox_right + (x - bbox_left) + offset);
	
	map[? GRAVITY_MAP.HSP] = 0;
	map[? GRAVITY_MAP.HSP_MOVE] = map[? GRAVITY_MAP.HSP];
	
	//Miss tech/bounce
	if (map[? GRAVITY_MAP.HSP_KNOCKBACK] != 0)
		if (player_tech)
			scKnockbackBounce();
		else
			map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
}

var touchingy = instance_place(x, y + map[? GRAVITY_MAP.VSP], oWall); //get the instance of the wall in the future in the vertical
if (touchingy != noone) { //If touching a wall in the vertical
	if (map[? GRAVITY_MAP.VSP] > 0) //Falling
		y = floor(touchingy.bbox_top + (y - bbox_bottom) - offset);
	else if (map[? GRAVITY_MAP.VSP] < 0) //Going up
		y = ceil(touchingy.bbox_bottom + (y - bbox_top) + offset);
	
	map[? GRAVITY_MAP.VSP] = 0;
	map[? GRAVITY_MAP.VSP_MOVE] = map[? GRAVITY_MAP.VSP];
	map[? GRAVITY_MAP.VSP_KNOCKBACK] = map[? GRAVITY_MAP.VSP];
}

//check to see if a wall is 1 pixel under (plus your vertical speed), then you are standing, and return that variable
map[? GRAVITY_MAP.STANDING] = instance_place(x, y + (offset * grv_dir + (map[? GRAVITY_MAP.GRAVITY] * grv_dir)), oWall) != noone;