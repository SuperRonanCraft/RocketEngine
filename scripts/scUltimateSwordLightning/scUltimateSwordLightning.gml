
var dir = argument[0];
var slash = instance_create_depth(x, y, depth - 20, oSwordSlash_Lightning);

//var dir = team == TEAM.NONE ? (facing == 1 ? 0 : 180) : (team == TEAM.LEFT ? 0 : 180);
facing = dir > -90 && dir <= 90 ? 1 : -1;

if (vsp_move > 0)
	vsp_move = 0;
	
vsp_move += (-jump_height - jump_adj) * grv_dir * 0.2;
hsp_move += (facing*5);

slash.owner = id;
slash.timer = 5;

with (slash)
	image_xscale = other.facing;	
