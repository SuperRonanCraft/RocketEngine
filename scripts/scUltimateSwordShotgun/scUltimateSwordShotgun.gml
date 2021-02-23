function scUltimateSwordShotgun() {

	var dir = argument[0];
	var slash = instance_create_depth(x, y, depth - 20, oSwordSlash_Shotgun);

	//var dir = team == TEAM.NONE ? (facing == 1 ? 0 : 180) : (team == TEAM.LEFT ? 0 : 180);
	facing = dir > -90 && dir <= 90 ? 1 : -1;

	var _map = gravity_map;
	if (_map[? GRAVITY_MAP.VSP_MOVE] > 0)
		_map[? GRAVITY_MAP.VSP_MOVE] = 0;

	_map[? GRAVITY_MAP.HSP_MOVE] += (facing * 25);

	player_map[?PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.ABILITYCHANNEL;

	slash.owner = id;
	slash.timer = 8;

	with (slash)
		image_xscale = other.facing;	



}
