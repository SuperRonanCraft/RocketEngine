/// @desc 
my_player = noone; //Player I control
my_player_x = 0;
my_player_y = 0;

socket = network_create_socket(network_socket_tcp);
global.socket = socket;
//Memory
buffer = buffer_create(16384, buffer_grow, 1);
var _ip = get_string("Ip Address", "127.0.0.1");
connect = network_connect(socket, _ip, NETWORK_PORT);

if (connect < 0) {
	show_message("Cannot reach server");
	game_restart();
	exit;
}


entities = ds_map_create();
global.play = false;
scNetworkSendName(global.name);