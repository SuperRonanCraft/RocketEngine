///@arg client-socket
///@arg network_command
///@arg entity-id
///@arg value

enum NETWORK_COMMAND {
	X, Y, NAME, CHARACTER, DESTROY, REMOTE_PLAYER
}

buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u8, NETWORK_PACKET.ENTITY);
buffer_write(buffer, buffer_u8, argument1); //second command?
buffer_write(buffer, buffer_u32, argument2); //id of entity

switch (argument1) {
	case NETWORK_COMMAND.X:
		buffer_write(buffer, buffer_s16, argument3);
		break;
	case NETWORK_COMMAND.Y:
		buffer_write(buffer, buffer_s16, argument3);
		break;
	case NETWORK_COMMAND.NAME:
		buffer_write(buffer, buffer_string, argument3);
		break;
	case NETWORK_COMMAND.CHARACTER:
		buffer_write(buffer, buffer_u8, argument3);
		break;
	case NETWORK_COMMAND.DESTROY:
		buffer_write(buffer, buffer_u8, argument3);
		break;
	case NETWORK_COMMAND.REMOTE_PLAYER:
		buffer_write(buffer, buffer_bool, argument3);
		break;
}

network_send_packet(argument0, buffer, buffer_tell(buffer));