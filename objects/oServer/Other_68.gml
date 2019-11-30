/// @desc 
var n_id = ds_map_find_value(async_load, "id");					//get the ID of the socket receiving the data
if (n_id == global.broadcast_server) {							
	var ip = ds_map_find_value(async_load, "ip");

	// incoming data for the server from a connected saocket
	var _buff = ds_map_find_value(async_load, "buffer");
	var _name = buffer_read(_buff, buffer_string);
     
	var t = ds_map_find_value(async_load, "type");
	// Add to our list...if we don't already have it!
	var index = ds_list_find_index(global.serverlist, ip);
	if (index < 0) {
	    ds_list_add(global.serverlist, ip);
	    ds_list_add(global.servernames, _name);
	    show_debug_message("New server found at: " + ip + " called: " + _name + " socket:" + string(t));
	}
																//check ID to make sure it is that of the server socket{
					//get the type of network event
	/*switch (t) {
		case network_type_connect:								//if it is a connect event, get the socket ID of the connection
			var sock = ds_map_find_value(async_load, "socket");	//and store it in a variable
			ds_list_add(socketlist, sock);						//then write it to a DS list for future reference
			break;
		case network_type_disconnect:
			var sock = ds_map_find_value(async_load, "socket");
			ds_map_delete(socketlist, sock);
			break;
		case network_type_data:
			//Data handling here...
			break;
	}*/
}