/// @desc Update x/y and health
var _update = ds_list_create();
for (var i = 0; i < ds_list_size(sockets); i++) { //Go through all sockets
	var _map = clients_map[? ds_list_find_value(sockets, i)];
	var _pl = _map[? CLIENT_MAP.PLAYER_ID]; //Player of socket
	//UPDATE HEALTH
	var _update_hp = false;
	if (_pl.shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] != _map[? CLIENT_MAP.HEALTH_BASE])
		_update_hp = true;
	else if (_pl.shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] != _map[? CLIENT_MAP.HEALTH_ARMOR])
		_update_hp = true;
	else if (_pl.shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] != _map[? CLIENT_MAP.HEALTH_SHIELD])
		_update_hp = true;
	for (var a = 0; a < ds_list_size(sockets); a++) { //Send data to all sockets
		var _map_so = clients_map[? ds_list_find_value(sockets, i)];
		//X/Y position
		if (_map[? CLIENT_MAP.SOCKET] != _map_so[? CLIENT_MAP.SOCKET]) { //Not the sockets player
			scNetworkSendRemoteEntity(_map_so[? CLIENT_MAP.SOCKET], NETWORK_ENTITY.X, _pl.id, _pl.x);
			scNetworkSendRemoteEntity(_map_so[? CLIENT_MAP.SOCKET], NETWORK_ENTITY.Y, _pl.id, _pl.y);	
		}
		//Health
		if (_update_hp)
			scNetworkSendRemoteEntity(_map_so[? CLIENT_MAP.SOCKET], NETWORK_ENTITY.HEALTH, _pl.id, 
				_map[? CLIENT_MAP.HEALTH_BASE], 
				_map[? CLIENT_MAP.HEALTH_ARMOR], 
				_map[? CLIENT_MAP.HEALTH_SHIELD]);
	}
	//Health changed?
	if (_update_hp)
		ds_list_add(_update, _map[? CLIENT_MAP.SOCKET]);
}

//Update server side health
for (var i = 0; i < ds_list_size(_update); i++) {
	var _map = clients_map[? ds_list_find_value(_update, i)];
	var _pl = _map[? CLIENT_MAP.PLAYER_ID];
	_map[? CLIENT_MAP.HEALTH_BASE] = _pl.shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
	_map[? CLIENT_MAP.HEALTH_ARMOR] = _pl.shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR];
	_map[? CLIENT_MAP.HEALTH_SHIELD] = _pl.shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD];
}