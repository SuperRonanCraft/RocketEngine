/// @desc

#macro NETWORK_PORT 38656
#macro NETWORK_MAX_CLIENTS 2

//Packets
enum NETWORK_PACKET {
	KEY, ENTITY, NAME, CHARACTER, COMMAND, POSITION, HEALTH
}

server = network_create_server(network_socket_tcp, NETWORK_PORT, NETWORK_MAX_CLIENTS);
buffer = buffer_create(16384, buffer_grow, 1);
clients_map = ds_map_create();
sockets = ds_list_create();

//alarm[0] = room_speed / 2;