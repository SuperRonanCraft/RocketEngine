//Send key to server
///@arg character
if (instance_exists(oClient))
	with (oClient) {
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, NETWORK_PACKET.CHARACTER);
		buffer_write(buffer, buffer_u8, argument0);
		network_send_packet(socket, buffer, buffer_tell(buffer));
	}