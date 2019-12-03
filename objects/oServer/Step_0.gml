/// @desc 
for (var i = 0; i < ds_list_size(sockets); i++) { //Send position of all players to all sockets but not own sockets player
	var _map = clients_map[? ds_list_find_value(sockets, i)];
	var _pl = _map[? CLIENT_MAP.PLAYER_ID];
	for (var a = 0; a < ds_list_size(sockets); a++) {
		var _map_so = clients_map[? ds_list_find_value(sockets, i)];
		if (_map[? CLIENT_MAP.SOCKET] != _map_so[? CLIENT_MAP.SOCKET]) { //Not the sockets player
			scNetworkSendRemoteEntity(_map_so[? CLIENT_MAP.SOCKET], NETWORK_ENTITY.X, _pl.id, _pl.x);
			scNetworkSendRemoteEntity(_map_so[? CLIENT_MAP.SOCKET], NETWORK_ENTITY.Y, _pl.id, _pl.y);
			//UPDATE HEALTH
			var _update_hp = false;
			if (_pl.shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] != _map[? CLIENT_MAP.HEALTH_BASE])
				_update_hp = true;
			else if (_pl.shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] != _map[? CLIENT_MAP.HEALTH_ARMOR])
				_update_hp = true;
			else if (_pl.shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] != _map[? CLIENT_MAP.HEALTH_SHIELD])
				_update_hp = true;
			if (_update_hp) {
				_map[? CLIENT_MAP.HEALTH_BASE] = _pl.shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
				_map[? CLIENT_MAP.HEALTH_ARMOR] = _pl.shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR];
				_map[? CLIENT_MAP.HEALTH_SHIELD] = _pl.shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD];
				scNetworkSendRemoteEntity(_map_so[? CLIENT_MAP.SOCKET], NETWORK_ENTITY.HEALTH, _pl.id, 
					_map[? CLIENT_MAP.HEALTH_BASE], 
					_map[? CLIENT_MAP.HEALTH_ARMOR], 
					_map[? CLIENT_MAP.HEALTH_BASE]);
				
			}	
		}
	}
}