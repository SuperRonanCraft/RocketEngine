///@desc Knockback an oPlayer
///@arg target entity to knockback
///@arg amount of knockback
///@arg direction getting hit from

var owner = argument[0];
if (!owner.player_knockback) exit;

var maxV = argument[1];
var maxH = argument[1];
var hitFrom = argument[2]; //Direction getting hit from
var side = hitFrom > 90 && hitFrom < 270; //side rocket is facing (true is left)
if (hitFrom > 270)
	hitFrom -= 360
var dir = side ? 180 : 0;
var diff = hitFrom - dir;
if (side) //facing left
	dir = clamp(135 + diff, 100, 135);
else
	dir = clamp(45 + diff, 45, 80);

owner.playerMap[? PLAYER_MAP.CAN_CONTROL] = false;
owner.playerMap[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.KNOCKBACK;
var hval = lengthdir_x(maxH, dir), vval = lengthdir_y(maxV, dir);
owner.hsp_knockback = hval;
owner.vsp_knockback = vval;// * sign(owner.grv_dir);
owner.vsp_move = 0; //Reset gravity
owner.knockback_time = 300 * TIME_SPEED;
owner.hsp_move = 0;
//owner.facing = side ? 1 : -1;
if (owner.standing)
	owner.y -= 2 * sign(owner.grv_dir);

owner.standing = false;