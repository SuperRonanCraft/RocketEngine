/// @desc 
socket = network_create_socket(network_socket_tcp);
global.socket = socket;
//Memory
buffer = buffer_create(16384, buffer_grow, 1);
connect = network_connect(socket, "127.0.0.1", NETWORK_PORT);

if (connect < 0) {
	show_message("Cannot reach server");
	game_restart();
	exit;
}


entities = ds_map_create();
scNetworkSendName(global.name);