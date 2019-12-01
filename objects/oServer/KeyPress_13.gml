/// @desc Ready!
global.play = !global.play;
for (var s = 0; s < ds_list_size(sockets); s++) {
	var so = ds_list_find_value(sockets, s);
	scNetworkSendCommand(so, NETWORK_COMMAND.PLAY, global.play);
}