///@desc Knockback a pShootable
///@arg target Entity to knockback
///@arg amount Knockback amount
///@arg direction direction getting hit from

var owner = argument[0];

var maxV = -argument[1];
var maxH = -argument[1];
var dir = argument[2]; //Direction of rocket

owner.canControl = false;
owner.playerState = PLAYERSTATE.KNOCKBACK;
owner.hsp_knockback = maxH * (owner.facing);
owner.vsp_knockback = maxV;
owner.knockback_time = 30;
owner.y-=2;
owner.standing = false;
	
