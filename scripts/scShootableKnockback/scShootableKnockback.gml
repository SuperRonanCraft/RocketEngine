///@desc Knockback an oPlayer
///@arg target entity to knockback
///@arg amount of knockback
///@arg direction getting hit from
function scShootableKnockback() {

	if(argument[1] == 0) exit;

	var owner = argument[0];
	var _map = owner.gravity_map;
	if (!_map[? GRAVITY_MAP.KNOCKBACK_ENABLED]) exit;

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

	owner.player_map[? PLAYER_MAP.CAN_CONTROL] = false;
	owner.player_map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.KNOCKBACK;
	var hval = lengthdir_x(maxH, dir), vval = lengthdir_y(maxV, dir);
	_map[? GRAVITY_MAP.HSP_KNOCKBACK] = hval;
	_map[? GRAVITY_MAP.VSP_KNOCKBACK] = vval;// * sign(owner.grv_dir);
	_map[? GRAVITY_MAP.VSP_MOVE] = 0; //Reset gravity
	_map[? GRAVITY_MAP.HSP_MOVE] = 0;
	//owner.facing = side ? 1 : -1;
	if (_map[? GRAVITY_MAP.STANDING])
		owner.y -= 2 * sign(owner.grv_dir);

	//_map[? GRAVITY_MAP.STANDING] = false;


}
