///@arg socket
///@arg player_id
function scNetworkClientStart(argument0, argument1) {

	var _map = ds_map_create();

	_map[? CLIENT_MAP.SOCKET] = argument0;
	var _p = argument1;
	_map[? CLIENT_MAP.PLAYER_ID] = _p;
	_map[? CLIENT_MAP.HEALTH_BASE] = _p.shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
	_map[? CLIENT_MAP.HEALTH_ARMOR] = _p.shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR];;
	_map[? CLIENT_MAP.HEALTH_SHIELD] = _p.shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD];;

	return _map;
	enum CLIENT_MAP {
		SOCKET, PLAYER_ID, HEALTH_BASE, HEALTH_ARMOR, HEALTH_SHIELD
	}


}
