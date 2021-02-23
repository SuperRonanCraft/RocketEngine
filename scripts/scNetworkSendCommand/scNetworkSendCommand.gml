///@arg client-socket
///@arg network_command
///@arg value
function scNetworkSendCommand(argument0, argument1, argument2) {

	enum NETWORK_COMMAND {
		PLAY
	}

	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8, NETWORK_PACKET.COMMAND); //packet
	buffer_write(buffer, buffer_u8, argument1); //command

	switch (argument1) { //value
		case NETWORK_COMMAND.PLAY:
			buffer_write(buffer, buffer_bool, argument2);
			break;
	}

	network_send_packet(argument0, buffer, buffer_tell(buffer));


}
