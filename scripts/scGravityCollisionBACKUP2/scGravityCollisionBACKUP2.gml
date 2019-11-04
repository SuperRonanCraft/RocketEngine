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
var touching_amt = instance_place_list(x, y, oWall,touching,false); //get the instance of the wall in the future in the horizontal
//MID LOCATION (> 32 VECTOR)
var newWalls = noone; //Check for later


var checkNewY = 0;
var checkNewX = 0;

var _dis = floor(point_distance(x, y, x + _hsp, y + _vsp));

var x_change = map[? GRAVITY_MAP.HSP];
var y_change = map[? GRAVITY_MAP.VSP];


if (touching_amt == 0 && _dis >= 16) {
	var inter = _dis / 16;

	for (var i = 1; i < inter; i++) {
		x_change = point_distance(x, y, x + (_hsp / inter) * i, y) * sign(_hsp);
		y_change = point_distance(x, y, x, y + (_vsp / inter) * i) * sign(_vsp);
		
		touching_amt = instance_place_list(x + x_change, y + y_change, oWall,touching,false); //get the instance of the wall in the future in the horizontal
		instance_create_depth(x + x_change, y + y_change, -300,oPlace);
	
		
		if (touching_amt != 0)
			break;
	}
}

if (touching_amt == 0)
	touching_amt = instance_place_list(x + _hsp, y + _vsp, oWall,touching,false); //get the instance of the wall in the future


var change_x = false;
var change_y = false;

var setX = false;
var setY = false;

if (touching_amt != 0) { //If touching a wall in the horizontal
	for(var i = 0; i < touching_amt; i ++){
		
		_hsp = x_change;
		_vsp = y_change;
		
		var wall = touching[|i];
		
		change_x = false;
		change_y = false;
		
		var tempY = y;
		
		var bbox_height = bbox_bottom-bbox_top;
		var bbox_width = bbox_right - bbox_left;
		
		var toleranceSnapY = 1;
		var toleranceSnapX = 1;
		
		//Snap to new locations
		//Define a desired y value, and set change_y to true so we can check later.
		if (wall.bbox_top > bbox_top && sign(_vsp) >= 0 ) { //Falling
			var differenceInY = (y - bbox_bottom);
			
			var newY = floor(wall.bbox_top + differenceInY) - offset;
			var distanceToSnap = max(y,newY)-min(y,newY);
			var vspCheck = _vsp*1;
			
			if(floor(abs(vspCheck)) >= 1)
				toleranceSnapY = ( distanceToSnap/vspCheck);
			else
				toleranceSnapY = 0;
			
			if(toleranceSnapY < 1){ 
				checkNewY = floor(wall.bbox_top + differenceInY) - offset;
				
				change_y = true;
				
			}
			
		} else if (wall.bbox_bottom < bbox_bottom && sign(_vsp) == -1) { //Jumping
			
			var differenceInY = y - bbox_top;
			
			var newY = floor(wall.bbox_bottom + differenceInY) + offset;
			var distanceToSnap = max(y,newY)-min(y,newY);
			var vspCheck = _vsp*2;
			
			if(abs(vspCheck) != 0)
				toleranceSnapY = ( distanceToSnap/vspCheck);
			else
				toleranceSnapY = 0;
			
			if(abs(toleranceSnapY) < 1){ 
				checkNewY = floor(wall.bbox_bottom + differenceInY) + offset;
				
				change_y = true;
				
			}
		}
		
		
		//This is where we check if the desired y results inside a wall
		if(change_y){
			
			//if(touching_amt > 1){
			newWalls = instance_place(x+_hsp,checkNewY,oWall);
			if(newWalls == noone){
				y = checkNewY;
					
			}
				
				//If it doesn't, clip to this new y
			//}
			/*
			else if(touching_amt <= 1 && instance_place(x,checkNewY,oWall) == noone){
				y = checkNewY;	
			}
			*/
			
			else{
				//No snapping is done
				if(newWalls.id != wall.id && ds_list_find_index(touching,newWalls) == -1){
					ds_list_add(touching,newWalls);
					touching_amt++;
					setY = true;
				}
				change_y = false;
			}
		}
		//If no y snap is done, check your x
		//Define a desired x value, and set change_x to true so we can check later.
		if (!change_y){
			if (wall.bbox_left >= bbox_right) { //Going right
				var differenceInX = (x - bbox_right);
				
				if(abs(differenceInX) < bbox_width*toleranceSnapX){ 
					checkNewX = floor(wall.bbox_left+ differenceInX) - offset;
				
					change_x = true;
				}
			} else if (wall.bbox_right <= bbox_left) { //Going left
				var differenceInX = (x - bbox_left);
				
				if(abs(differenceInX) < bbox_width*toleranceSnapX){ 
					checkNewX = ceil(wall.bbox_right + differenceInX) + offset;
				
					change_x = true;
				}
			}
		}
		
		//Now we check if there is a wall in the desired x position, just like the y from before
		newWalls = noone;
		if(change_x){
			newWalls = instance_place(checkNewX,y+_vsp,oWall);
			if(newWalls == noone){
				x = checkNewX;
				//If not, clip to this new x
			}
			else{
				//No snapping on x is done.
				if(newWalls.id != wall.id  && ds_list_find_index(touching,newWalls) == -1){
					ds_list_add(touching,newWalls);
					touching_amt++;
					change_x = false;
				}
				setX = true;
			}
		}
		
		
		if(!change_x && !change_y && touching_amt > 1){
			setX = true;
			setY = true;
			break;
		
		}
		else{
			setY = false;
			setX = false;
		}
	
		
		
	}
	
if (change_x || setX) {
	map[? GRAVITY_MAP.HSP] = 0;
	map[? GRAVITY_MAP.HSP_MOVE] = map[? GRAVITY_MAP.HSP];
	
	if (map[? GRAVITY_MAP.HSP_KNOCKBACK] != 0)
		if (player_tech)
			scKnockbackBounce();
		else
			map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
}
		
if (change_y || setY) {
	map[? GRAVITY_MAP.VSP] = 0;
	map[? GRAVITY_MAP.VSP_MOVE] = map[? GRAVITY_MAP.VSP];
	map[? GRAVITY_MAP.VSP_KNOCKBACK] = map[? GRAVITY_MAP.VSP];
}	

	
}
	

//check to see if a wall is 1 pixel under (plus your vertical speed), then you are standing, and return that variable
//ds_list_destroy(touching);
map[? GRAVITY_MAP.STANDING] = instance_place(x, y + (offset * grv_dir + (map[? GRAVITY_MAP.GRAVITY] * grv_dir)), oWall) != noone;