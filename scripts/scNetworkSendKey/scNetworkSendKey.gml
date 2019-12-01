//Send key to server
///@arg Key-type
///@arg value
if (instance_exists(oClient))
	with (oClient) {
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, NETWORK_PACKET.KEY);
		buffer_write(buffer, buffer_u8, argument0); //Key
		buffer_write(buffer, buffer_u8, argument1); //Value
		network_send_packet(socket, buffer, buffer_tell(buffer));
	}