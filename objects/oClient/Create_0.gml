/// @desc 
client_socket = network_create_socket(network_socket_tcp);
var server = network_connect(client_socket, "127.0.0.1", 6510);
if (server < 0) {
    //No connection! Failsafe codes here...
} else {
    //Connected!
}