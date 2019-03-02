global.Server = -1;
global.connectip = "127.0.0.1";
global.InitObject = id;
global.haveserver = false;
global.ServerType = network_socket_tcp;
global.PlayerTotal= 0;
global.BaddieCount = 0;

//global.listzero = ds_list_create();     // we dont want to use index 0! (maps return 0 on error)
//global.mapzero = ds_map_create();       // we dont want to use index 0! (maps return 0 on error)
global.serverlist = ds_list_create();
global.servernames = ds_list_create();

// Create a server and listen on our broadcast port....
global.broadcast_server = network_create_server(network_socket_udp, 6511, 100);


