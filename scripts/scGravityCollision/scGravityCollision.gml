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
var touching_amt = instance_place_list(x + sign(_hsp), y + sign(_vsp), oWall,touching,false); //get the instance of the wall in the future in the horizontal
//MID LOCATION (> 32 VECTOR)
var newWalls = noone; //Check for later


var checkNewY = 0;
var checkNewX = 0;

var _dis = floor(point_distance(x, y, x + _hsp, y + _vsp));

var x_change = map[? GRAVITY_MAP.HSP];
var y_change = map[? GRAVITY_MAP.VSP];

/*
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
*/
if(touching_amt > 0){
	
	var change_x = x;
	var change_y = y;
	
	if(y_change == 0){
		y_change = -1;	
	}
	
	while(touching_amt != 0){
		touching_amt = instance_place_list( change_x + (offset * -sign(x_change)), change_y + (offset * -sign(y_change)), oWall, touching, false );
		change_x += offset * -sign(x_change);
		change_y += offset * -sign(y_change);
	}
	
	x = change_x;
	y = change_y;
	
	if(sign(x_change != 0)){
		map[? GRAVITY_MAP.HSP] = 0;
		map[? GRAVITY_MAP.HSP_MOVE] = map[? GRAVITY_MAP.HSP];
	
		if (map[? GRAVITY_MAP.HSP_KNOCKBACK] != 0)
			if (player_tech)
				scKnockbackBounce();
			else
				map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
	}
	
	if(sign(y_change) == 1 || (sign(y_change) == 0 && map[? GRAVITY_MAP.STANDING]) ){
		map[? GRAVITY_MAP.VSP] = 0;
		map[? GRAVITY_MAP.VSP_MOVE] = map[? GRAVITY_MAP.VSP];
		map[? GRAVITY_MAP.VSP_KNOCKBACK] = map[? GRAVITY_MAP.VSP];
	}
	
	
	
}



//check to see if a wall is 1 pixel under (plus your vertical speed), then you are standing, and return that variable
//ds_list_destroy(touching);
map[? GRAVITY_MAP.STANDING] = instance_place(x, y + (offset * grv_dir + (map[? GRAVITY_MAP.GRAVITY] * grv_dir)), oWall) != noone;