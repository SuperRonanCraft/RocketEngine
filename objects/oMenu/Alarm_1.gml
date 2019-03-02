/// @description  Start game - local client+server
global.ServerName = oTextBox.text;
global.Server = instance_create_layer(0, 0, "Instance_Layer", oServer);

if global.haveserver == false
{
show_debug_message("Cant create server");
}
else
{
global.connectip = "127.0.0.1";
network_destroy(global.broadcast_server);
global.broadcast_server = -1;
room_goto(rTestArea);
}

