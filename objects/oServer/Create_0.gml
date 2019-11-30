/// @desc 
global.broadcast_server = network_create_server(network_socket_tcp, 6511, 4);
global.serverlist = ds_list_create();
global.servernames = ds_list_create();

if (global.broadcast_server < 0) {
	//Connection error! Fail safe code here
	show_debug_message("------bcast server failed!");
} else {
	show_debug_message("------server binded!");
}