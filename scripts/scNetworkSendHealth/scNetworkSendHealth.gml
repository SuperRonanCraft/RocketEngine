//Send key to server
///@arg base
///@arg armor
///@arg shield
exit; //DISABLED
if (instance_exists(oClient))
	with (oClient) {
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u8, NETWORK_PACKET.HEALTH);
		buffer_write(buffer, buffer_u16, argument0);
		buffer_write(buffer, buffer_u16, argument1);
		buffer_write(buffer, buffer_u16, argument2);
		network_send_packet(socket, buffer, buffer_tell(buffer));
	}