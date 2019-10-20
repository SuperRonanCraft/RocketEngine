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

var _hsp = map[? GRAVITY_MAP.HSP];
var _vsp = map[? GRAVITY_MAP.VSP];

var touching = ds_list_create();
//CURRENT LOCATION
var touching_amt = instance_place_list(x, y, oWall, touching, false); //get the instance of the wall in the future in the horizontal
//MID LOCATION (> 32 VECTOR)

var checkNewY = 0;
var checkNewX = 0;

if (touching_amt == 0) {
	var _dis = floor(point_distance(x, y, x + _hsp, y + _vsp));
	var inter = _dis / 32;

	for (var i = 1; i < inter; i++) {
		var x_change = point_distance(x, y, x + (_hsp / inter) * i, y) * sign(_hsp);
		var y_change = point_distance(x, y, x, y + (_vsp / inter) * i) * sign(_vsp);
		
		touching_amt = instance_place_list(x + x_change, y + y_change, oWall, touching, false); //get the instance of the wall in the future in the horizontal
		if (touching_amt != 0)
			break;
	}
}

if (touching_amt == 0)
	touching_amt = instance_place_list(x + _hsp, y + _vsp, oWall, touching, false); //get the instance of the wall in the future in the horizontal

if (touching_amt != 0) { //If touching a wall in the horizontal
	for (var i = 0; i < touching_amt; i++) {
		var wall = touching[| i];
		//show_debug_message("------");
		//show_debug_message("VSP = " + string(_vsp));
		//show_debug_message("HSP = " + string(_hsp));
		//var _vsp_c1 = wall.bbox_top - bbox_bottom - offset;
		//var _vsp_c2 = wall.bbox_bottom - bbox_top + offset;
		//var _hsp_c1 = wall.bbox_left - bbox_right - offset;
		//var _hsp_c2 = wall.bbox_right - bbox_left + offset;
		//show_debug_message("DIF VSP > 0 = " + string(_vsp_c1));
		//show_debug_message("DIF VSP < 0 = " + string(_vsp_c2));
		//show_debug_message("DIF HSP > 0 = " + string(_hsp_c1));
		//show_debug_message("DIF HSP < 0 = " + string(_hsp_c2));
		var change_x = false;
		var change_y = false;
		
		var bbox_height = bbox_bottom-bbox_top;
		var bbox_width = bbox_right - bbox_left;
		
		var toleranceSnap = 1;
		
		//Snap to new locations
		//Define a desired y value, and set change_y to true so we can check later.
		if (wall.bbox_top > bbox_top) { //Falling
			var differenceInY = (y - bbox_bottom);
			
			if(abs(differenceInY) < bbox_height*toleranceSnap){ 
				checkNewY = floor(wall.bbox_top + differenceInY) - offset;
				
				change_y = true;
			}
			
		} else if (wall.bbox_bottom < bbox_bottom) { //Jumping
			
			var differenceInY = y - bbox_top;
			
			if(abs(differenceInY) < bbox_height*toleranceSnap){
				checkNewY = ceil(wall.bbox_bottom + differenceInY) + offset;
			
				change_y = true;
			}
		}
		
		//This is where we check if the desired y results inside a wall
		if(change_y)
			if(instance_place(x,checkNewY,oWall) == noone){
				y = checkNewY;
				//If it doesn't, clip to this new y
			}
			else
				//No snapping is done
				change_y = false;
		
		//If no y snap is done, check your x
		//Define a desired x value, and set change_x to true so we can check later.
		if (!change_y){
			if (wall.bbox_left >= bbox_right) { //Going right
				checkNewX = floor(wall.bbox_left+ (x - bbox_right)) - offset;
				
				change_x = true;
			} else if (wall.bbox_right <= bbox_left) { //Going left
				checkNewX = ceil(wall.bbox_right + (x - bbox_left)) + offset;
				
				change_x = true;
			}
		}
		
		//Now we check if there is a wall in the desired x position, just like the y from before
		if(change_x)
			if(instance_place(checkNewX,y,oWall) == noone){
				x = checkNewX;
				//If not, clip to this new x
			}
			else
				//No snapping on x is done.
				change_x = false;
		
		if (change_x) {
			map[? GRAVITY_MAP.HSP] = 0;
			map[? GRAVITY_MAP.HSP_MOVE] = map[? GRAVITY_MAP.HSP];
	
			if (map[? GRAVITY_MAP.HSP_KNOCKBACK] != 0)
				if (player_tech)
					scKnockbackBounce();
				else
					map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
		}
		
		if (change_y) {
			map[? GRAVITY_MAP.VSP] = 0;
			map[? GRAVITY_MAP.VSP_MOVE] = map[? GRAVITY_MAP.VSP];
			map[? GRAVITY_MAP.VSP_KNOCKBACK] = map[? GRAVITY_MAP.VSP];
		}
		/*if (map[? GRAVITY_MAP.VSP] > 0) //Falling
			y = floor(touching.bbox_top + (y - bbox_bottom) - offset);
		else if (map[? GRAVITY_MAP.VSP] < 0) //Going up
			y = ceil(touching.bbox_bottom + (y - bbox_top) + offset);*/
		/*if(abs(_vsp_c1) + abs(_vsp_c2) < abs(_hsp_c1) + abs(_hsp_c2) ){
			scCollisionYCheck(map, 1, touching[| i]);
			if(instance_place(x,y,oWall)){
				scCollisionXCheck(map, 1, touching[| i]);
			}
		}
	
		else if(abs(_vsp_c1) + abs(_vsp_c2) > abs(_hsp_c1) + abs(_hsp_c2)){
			scCollisionXCheck(map, 1, touching[| i]);
			if(instance_place(x,y,oWall)){
				scCollisionYCheck(map, 1, touching[| i]);
			}
		}*/
	}
}

	//Normal wall collision
	/*if (map[? GRAVITY_MAP.HSP] > 0) //Going Right
		x = floor(touching.bbox_left + (x - bbox_right) - offset);
	else if (map[? GRAVITY_MAP.HSP] < 0) //Going Left
		x = ceil(touching.bbox_right + (x - bbox_left) + offset);
	
	map[? GRAVITY_MAP.HSP] = 0;
	map[? GRAVITY_MAP.HSP_MOVE] = map[? GRAVITY_MAP.HSP];
	
	//Miss tech/bounce
	if (map[? GRAVITY_MAP.HSP_KNOCKBACK] != 0)
		if (player_tech)
			scKnockbackBounce();
		else
			map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;

	if (map[? GRAVITY_MAP.VSP] > 0) //Falling
		y = floor(touching.bbox_top + (y - bbox_bottom) - offset);
	else if (map[? GRAVITY_MAP.VSP] < 0) //Going up
		y = ceil(touching.bbox_bottom + (y - bbox_top) + offset);
	
	map[? GRAVITY_MAP.VSP] = 0;
	map[? GRAVITY_MAP.VSP_MOVE] = map[? GRAVITY_MAP.VSP];
	map[? GRAVITY_MAP.VSP_KNOCKBACK] = map[? GRAVITY_MAP.VSP];*/

//check to see if a wall is 1 pixel under (plus your vertical speed), then you are standing, and return that variable
ds_list_destroy(touching);
map[? GRAVITY_MAP.STANDING] = instance_place(x, y + (offset * grv_dir + (map[? GRAVITY_MAP.GRAVITY] * grv_dir)), oWall) != noone;