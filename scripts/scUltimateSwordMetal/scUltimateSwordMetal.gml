
var dir = argument[0];
var slash = instance_create_depth(x, y, depth + 1, oSwordSlash_Metal);

//var dir = team == TEAM.NONE ? (facing == 1 ? 0 : 180) : (team == TEAM.LEFT ? 0 : 180);
facing = dir > -90 && dir <= 90 ? 1 : -1;

var _map = gravity_map;
if (_map[? GRAVITY_MAP.VSP_MOVE] > 0)
	_map[? GRAVITY_MAP.VSP_MOVE] = 0;
	
_map[? GRAVITY_MAP.VSP_MOVE] += (-_map[? GRAVITY_MAP.JUMP_HEIGHT]) * grv_dir / 2;
_map[? GRAVITY_MAP.HSP_MOVE] += (facing * 10);

slash.owner = id;

with (slash)
	image_xscale = other.facing;	
