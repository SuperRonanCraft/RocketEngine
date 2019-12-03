/// @desc 
var event_id = async_load[? "id"];

if (server == event_id) {
	var type = async_load[? "type"];
	var socket = async_load[? "socket"];
	if (type == network_type_connect) { //Connection
		//Create player
		ds_list_add(sockets, socket);
		var p = instance_create_layer(100 + 32 * socket, 100, "Instances", oPlayer);
		with (p) {
			var _sockets = other.sockets;
			scPlayerCharacterChange(CHARACTER.DEFAULT, false, false);
			var _map = player_map[? PLAYER_MAP.CHARACTER_INFO];
			_map[? CHARACTER_MAP.PALETTE_INDEX] = 0;
			//Alternate team sides
			if (ds_list_size(_sockets) mod 2 == 1)
				p.team = TEAM.LEFT;
			else
				p.team = TEAM.RIGHT;
			with (oSpawn)
				if (team == p.team) {
					p.x = x + 32 * (socket - ds_list_size(_sockets));
					p.y = y;
				}
			p.shootable_map[? SHOOTABLE_MAP.TEAM] = p.team;
		}
		if (socket != ds_list_find_value(sockets, 0))
			p.local_player = false;
		else
			oClient.my_player = p;
		ds_map_add(clients_map, socket, scNetworkClientStart(socket, p));
		//Data about socket
		//ready[socket] = false;
		
		//Send data about all players to new socket
		if (socket != ds_list_find_value(sockets, 0))
			for (var i = 0; i < ds_map_size(clients_map); i++) {
				var _client_map = clients_map[? ds_list_find_value(sockets, i)];
				show_debug_message("-----------");
				show_debug_message("Socket: " + string(_client_map[? CLIENT_MAP.SOCKET]));
				//if (_client_map[? CLIENT_MAP.SOCKET] == ds_list_find_value(sockets, 0)) continue;
				var _pl = _client_map[? CLIENT_MAP.PLAYER_ID];
				scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.X, _pl.id, _pl.x);
				scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.Y, _pl.id, _pl.y);
				scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.NAME, _pl.id, _pl.name);
				var _map = _pl.player_map[? PLAYER_MAP.CHARACTER_INFO];
				scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.CHARACTER, _pl.id, _map[? CHARACTER_MAP.TYPE]);
				scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.REMOTE_PLAYER, _pl.id, _pl == p);
				scNetworkSendCommand(socket, NETWORK_COMMAND.PLAY, global.play);
				scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.TEAM, _pl.id, _pl.team);
				scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.HEALTH, _pl.id, _client_map[? CLIENT_MAP.HEALTH_BASE], 
					_client_map[? CLIENT_MAP.HEALTH_ARMOR], _client_map[? CLIENT_MAP.HEALTH_SHIELD]);
			}
		show_debug_message("New player connected, synced data to new player on socket: " + string(socket));
	} else if (type == network_type_disconnect) {  //Disconnect
		//Remove player
		var p = clients_map[? socket];
		if (instance_exists(p))
			instance_destroy(p);
		ds_list_delete(sockets, ds_list_find_index(sockets, socket));
		ds_map_delete(clients_map, socket);
	}
} else if (event_id != global.socket) { //NOT OUR CLIENT
	var socket = async_load[? "id"];
	var buff = async_load[? "buffer"];
	
	show_debug_message("Socket Receive: " + string(socket));
	buffer_seek(buff, buffer_seek_start, 0);
	var cmd = buffer_read(buff, buffer_u8);
	show_debug_message("Socket Command: " + string(cmd));
	var _map = clients_map[? socket];
	var p = _map[? CLIENT_MAP.PLAYER_ID];
	switch (cmd) {
		case NETWORK_PACKET.KEY:
			var k = buffer_read(buff, buffer_u8);
			var v = buffer_read(buff, buffer_u8);
			with (p)
				scKeybindsControlsNetwork(true, k, v);
			for (var s = 0; s < ds_list_size(sockets); s++) {
				var so = ds_list_find_value(sockets, s);
				if (so != socket) //Do not send the data from socket back to it's self
					scNetworkSendRemoteEntity(so, NETWORK_ENTITY.KEY, p.id, k, v);
			}
			break;
		case NETWORK_PACKET.NAME:
			p.name = buffer_read(buff, buffer_string);
			for (var s = 0; s < ds_list_size(sockets); s++) {
				var so = ds_list_find_value(sockets, s);
				//if (so != socket)
				scNetworkSendRemoteEntity(so, NETWORK_PACKET.NAME, p.id, p.name);
			}
			break;
		case NETWORK_PACKET.CHARACTER:
			with (p)
				scPlayerCharacterChange(buffer_read(buff, buffer_u8), false, false);
			var _map = p.player_map[? PLAYER_MAP.CHARACTER_INFO];
			//Update health
			var _client_map = clients_map[? socket];
			_client_map[? CLIENT_MAP.HEALTH_BASE] = p.shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
			_client_map[? CLIENT_MAP.HEALTH_ARMOR] = p.shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR];
			_client_map[? CLIENT_MAP.HEALTH_SHIELD] = p.shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD];
			//Update character to socket
			for (var s = 0; s < ds_list_size(sockets); s++) {
				var so = ds_list_find_value(sockets, s);
				if (so != socket)
					scNetworkSendRemoteEntity(so, NETWORK_PACKET.CHARACTER, p.id, _map[? CHARACTER_MAP.TYPE]);
			}
			break;
		case NETWORK_PACKET.POSITION:
			var _x = buffer_read(buff, buffer_u16);
			var _y = buffer_read(buff, buffer_u16);
			if (abs(_x - p.x) > 32)
				p.x = _x;
			if (abs(_y - p.y) > 32)
				p.y = _y;
			for (var s = 0; s < ds_list_size(sockets); s++) {
				var so = ds_list_find_value(sockets, s);
				if (so != socket) {
					scNetworkSendRemoteEntity(so, NETWORK_ENTITY.X, p.id, _x);
					scNetworkSendRemoteEntity(so, NETWORK_ENTITY.Y, p.id, _y);
				}
			}
			break;
	}
}