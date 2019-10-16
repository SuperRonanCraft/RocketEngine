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

if (touching_amt == 0) {
	var _dis = floor(point_distance(x, y, x + _hsp, y + _vsp));
	var inter = _dis / 32;

	for (var i = 1; i < inter; i++) {
		var x_change = point_distance(x, y, x + (_hsp / inter) * i, y);
		var y_change = point_distance(x, y, x, y + (_vsp / inter) * i);
		
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
		var _vsp_c1 = wall.bbox_top - bbox_bottom - offset;
		var _vsp_c2 = wall.bbox_bottom - bbox_top + offset;
		var _hsp_c1 = wall.bbox_left - bbox_right - offset;
		var _hsp_c2 = wall.bbox_right - bbox_left + offset;
		show_debug_message("------");
		show_debug_message("DIF VSP > 0 = " + string(_vsp_c1));
		show_debug_message("DIF VSP < 0 = " + string(_vsp_c2));
		show_debug_message("DIF HSP > 0 = " + string(_hsp_c1));
		show_debug_message("DIF HSP < 0 = " + string(_hsp_c2));
		var change_x = false;
		var change_y = false;
		if (_vsp > 0) { //Falling
			if (abs(wall.bbox_top - bbox_bottom) <= 32) {
				var y_set = floor(wall.bbox_top + (y - bbox_bottom) - offset);
				if (y_set >= y) {
					y = y_set;
					change_y = true;
				}
			}
		} else if (_vsp < 0) { //Going up
			if (abs(wall.bbox_bottom - bbox_top) <= 32) {
				var y_set = ceil(wall.bbox_bottom + (y - bbox_top) + offset);
				if (y_set <= y) {
					y = y_set;
					change_y = true;
				}
			}
		}
		
		if (!change_y)
		if (_hsp > 0) { //Going Right
			if (abs(wall.bbox_left - bbox_right) <= 32) {
				x = floor(wall.bbox_left + (x - bbox_right) - offset);
				change_x = true;
			}
		} else if (_hsp < 0) { //Going Left
			if (abs(wall.bbox_right - bbox_left) <= 32) {
				x = ceil(wall.bbox_right + (x - bbox_left) + offset);
				change_x = true;
			}
		}
		
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