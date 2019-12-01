/// @desc 
for (var i = 0; i < instance_number(oPlayer); i++) {
	var _pl = instance_find(oPlayer, i);
	for (var s = 0; s < ds_list_size(sockets); s++) {
		var so = ds_list_find_value(sockets, s);
		scNetworkSendRemoteEntity(so, NETWORK_COMMAND.X, _pl.id, _pl.x);
		scNetworkSendRemoteEntity(so, NETWORK_COMMAND.Y, _pl.id, _pl.y);
	}
}