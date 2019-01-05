///@desc Knockback a pShootable
///@arg target Entity to knockback
///@arg amount Knockback amount
///@arg direction direction getting hit from

var owner = argument[0];

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

owner.canControl = false;
owner.playerState = PLAYERSTATE.KNOCKBACK;
var hval = lengthdir_x(maxH, dir), vval = lengthdir_y(maxV, dir);
owner.hsp_knockback = hval;
owner.vsp_knockback = vval;
owner.vsp_move = 0; //Reset gravity
owner.knockback_time = 300;
//owner.facing = side ? 1 : -1;
owner.y -= 2;
owner.standing = false;