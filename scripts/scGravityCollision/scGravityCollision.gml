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

//Horizontal
if (place_meeting(x + _hsp, y, oWall)) {
	if (_hsp == 0)
		_hsp = map[? GRAVITY_MAP.HSP_LAST];
	while(!place_meeting(x + sign(_hsp), y, oWall))
		x += sign(_hsp);
	map[? GRAVITY_MAP.HSP] = 0;
	map[? GRAVITY_MAP.HSP_MOVE] = map[? GRAVITY_MAP.HSP];
	
	if (map[? GRAVITY_MAP.HSP_KNOCKBACK] != 0)
		if (player_tech)
			scKnockbackBounce();
		else
			map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
}

//Vertical
if (place_meeting(x, y + _vsp, oWall)) {
	if (_vsp != 0)
		while(!place_meeting(x, y + sign(_vsp), oWall))
			y += sign(_vsp);
	else {
		_vsp = map[? GRAVITY_MAP.VSP_LAST] != 0 ? map[? GRAVITY_MAP.VSP_LAST] : 1;
		show_debug_message("BAD COLLISION Y " + string(_vsp));
		while(place_meeting(x, y + sign(_vsp), oWall))
			y -= sign(_vsp);
	}
	map[? GRAVITY_MAP.VSP] = 0;
	map[? GRAVITY_MAP.VSP_MOVE] = map[? GRAVITY_MAP.VSP];
	map[? GRAVITY_MAP.VSP_KNOCKBACK] = map[? GRAVITY_MAP.VSP];
}

//check to see if a wall is 1 pixel under (plus your vertical speed), then you are standing, and return that variable
//ds_list_destroy(touching);
map[? GRAVITY_MAP.STANDING] = instance_place(x, y + (offset * grv_dir + (map[? GRAVITY_MAP.GRAVITY] * grv_dir)), oWall) != noone;