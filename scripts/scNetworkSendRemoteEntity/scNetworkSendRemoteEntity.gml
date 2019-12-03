///@arg client-socket
///@arg network_entity
///@arg entity-id
///@arg value-1
///@arg value-2

enum NETWORK_ENTITY {
	X, Y, NAME, CHARACTER, DESTROY, REMOTE_PLAYER, KEY, TEAM, HEALTH
}

buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u8, NETWORK_PACKET.ENTITY);
buffer_write(buffer, buffer_u8, argument[1]); //second command?
buffer_write(buffer, buffer_u32, argument[2]); //id of entity

switch (argument[1]) {
	case NETWORK_ENTITY.X:
		buffer_write(buffer, buffer_s16, argument[3]);
		break;
	case NETWORK_ENTITY.Y:
		buffer_write(buffer, buffer_s16, argument[3]);
		break;
	case NETWORK_ENTITY.NAME:
		buffer_write(buffer, buffer_string, argument[3]);
		break;
	case NETWORK_ENTITY.CHARACTER:
		buffer_write(buffer, buffer_u8, argument[3]);
		break;
	case NETWORK_ENTITY.DESTROY:
		buffer_write(buffer, buffer_u8, argument[3]);
		break;
	case NETWORK_ENTITY.REMOTE_PLAYER:
		buffer_write(buffer, buffer_bool, argument[3]);
		break;
	case NETWORK_ENTITY.KEY:
		buffer_write(buffer, buffer_u8, argument[3]);
		buffer_write(buffer, buffer_u8, argument[4]);
		break;
	case NETWORK_ENTITY.TEAM:
		buffer_write(buffer, buffer_u8, argument[3]);
		break;
	case NETWORK_ENTITY.HEALTH:
		buffer_write(buffer, buffer_u8, argument[3]);
		buffer_write(buffer, buffer_u8, argument[4]);
		buffer_write(buffer, buffer_u8, argument[5]);
		break;
}

network_send_packet(argument[0], buffer, buffer_tell(buffer));