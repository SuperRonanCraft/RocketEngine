/// @desc Client to Server
var event_id = async_load[? "id"];

if (socket == event_id) { //Our socket
	var buff = async_load[? "buffer"];
	buffer_seek(buff, buffer_seek_start, 0);
	var cmd = buffer_read(buff, buffer_u8);
	
	switch (cmd) {
		case NETWORK_PACKET.ENTITY:
			var cmd = buffer_read(buff, buffer_u8);
			var e_id = buffer_read(buff, buffer_u32);
			
			if (!ds_map_exists(entities, e_id)) {
				var p = instance_create_layer(0, 0, "Instances", oPlayer);
				ds_map_set(entities, e_id, p);
			}
			
			var p = entities[? e_id];
			switch (cmd) {
				case NETWORK_COMMAND.X:
					p.x = buffer_read(buff, buffer_s16);
					break;
				case NETWORK_COMMAND.Y:
					p.y = buffer_read(buff, buffer_s16);
					break;
				case NETWORK_COMMAND.NAME:
					p.name = buffer_read(buff, buffer_string);
					break;
				case NETWORK_COMMAND.SPRITE:
					p.sprite_index = buffer_read(buff, buffer_u16);
					break;
				case NETWORK_COMMAND.DESTROY:
					buffer_read(buff, buffer_u8);
					instance_destroy(p);
					ds_map_delete(entities, e_id);
					break;
				case NETWORK_COMMAND.REMOTE_PLAYER:
					p.local_player = buffer_read(buff, buffer_bool);
					break;
			}
			break;
	}
}