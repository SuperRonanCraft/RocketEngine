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
			scPlayerCharacterChange(CHARACTER.DEFAULT, false);
			var _map = player_map[? PLAYER_MAP.CHARACTER_INFO];
			_map[? CHARACTER_MAP.PALETTE_INDEX] = 0;
		}
		if (socket != ds_list_find_value(sockets, 0))
			p.local_player = false;
		else
			oClient.my_player = p;
		ds_map_add(clients, socket, p);
		//Data about socket
		//ready[socket] = false;
		
		//Send data about all players to new socket
		for (var i = 0; i < instance_number(oPlayer); i++) {
			var _pl = instance_find(oPlayer, i);
			scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.X, _pl.id, _pl.x);
			scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.Y, _pl.id, _pl.y);
			scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.NAME, _pl.id, _pl.name);
			var _map = _pl.player_map[? PLAYER_MAP.CHARACTER_INFO];
			scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.CHARACTER, _pl.id, _map[? CHARACTER_MAP.TYPE]);
			scNetworkSendRemoteEntity(socket, NETWORK_ENTITY.REMOTE_PLAYER, _pl.id, _pl == p);
		}
		show_debug_message("New player connected, Syncing....");
	} else if (type == network_type_disconnect) {  //Disconnect
		//Remove player
		var p = clients[? socket];
		if (instance_exists(p))
			instance_destroy(p);
		ds_list_delete(sockets, ds_list_find_index(sockets, socket));
		ds_map_delete(clients, socket);
	}
} else if (event_id != global.socket) { //NOT OUR CLIENT
	var socket = async_load[? "id"];
	var buff = async_load[? "buffer"];
	
	buffer_seek(buff, buffer_seek_start, 0);
	var cmd = buffer_read(buff, buffer_u8);
	var p = clients[? socket];
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
			with (p) {
				scPlayerCharacterChange(buffer_read(buff, buffer_u8), false, false);
			}
			var _map = p.player_map[? PLAYER_MAP.CHARACTER_INFO];
			for (var s = 0; s < ds_list_size(sockets); s++) {
				var so = ds_list_find_value(sockets, s);
				if (so != socket)
					scNetworkSendRemoteEntity(so, NETWORK_PACKET.CHARACTER, p.id, _map[? CHARACTER_MAP.TYPE]);
			}
			break;
		case NETWORK_PACKET.POSITION:
			var _x = buffer_read(buff, buffer_u16);
			var _y = buffer_read(buff, buffer_u16);
			p.x = _x;
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