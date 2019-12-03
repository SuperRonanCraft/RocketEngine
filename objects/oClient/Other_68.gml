/// @desc Client to Server
if (instance_exists(oServer)) exit; //I dont need to read data from server (I am the server)
var event_id = async_load[? "id"];

if (socket != event_id) exit; //NOT our socket

var buff = async_load[? "buffer"];
buffer_seek(buff, buffer_seek_start, 0);
var cmd = buffer_read(buff, buffer_u8);
	
switch (cmd) {
	case NETWORK_PACKET.ENTITY:
		var cmd = buffer_read(buff, buffer_u8);
		var e_id = buffer_read(buff, buffer_u32);
			
		if (!ds_map_exists(entities, e_id)) {
			var p = instance_create_layer(0, 0, "Instances", oPlayer);
			with (p) {
				scPlayerCharacterChange(CHARACTER.DEFAULT, false, false);
				var _map = player_map[? PLAYER_MAP.CHARACTER_INFO];
				_map[? CHARACTER_MAP.PALETTE_INDEX] = 0;
				local_player = false;
			}
			ds_map_set(entities, e_id, p);
			show_debug_message("Player Created! " + string(e_id));
		}
			
		var p = entities[? e_id];
		switch (cmd) {
			case NETWORK_ENTITY.X:
				var _x = buffer_read(buff, buffer_s16);
				if (abs(_x - p.x) > 32)
					p.x = _x;
				break;
			case NETWORK_ENTITY.Y:
				var _y = buffer_read(buff, buffer_s16);
				if (abs(_y - p.y) > 32)
					p.y = _y;
				break;
			case NETWORK_ENTITY.NAME:
				p.name = buffer_read(buff, buffer_string);
				break;
			case NETWORK_ENTITY.CHARACTER:
				with (p)
					scPlayerCharacterChange(buffer_read(buff, buffer_u8), false, false);
				break;
			case NETWORK_ENTITY.DESTROY:
				buffer_read(buff, buffer_u8);
				instance_destroy(p);
				ds_map_delete(entities, e_id);
				break;
			case NETWORK_ENTITY.REMOTE_PLAYER:
				p.local_player = buffer_read(buff, buffer_bool);
				if (p.local_player) {
					my_player = p;
					my_player_x = p.x;
					my_player_y = p.y;
				}
				break;
			case NETWORK_ENTITY.KEY:
				var k = buffer_read(buff, buffer_u8);
				var v = buffer_read(buff, buffer_u8);
				with (p)
					scKeybindsControlsNetwork(true, k, v);
				break;
			case NETWORK_ENTITY.TEAM:
				with (p) {
					team = buffer_read(buff, buffer_u8);
					shootable_map[? SHOOTABLE_MAP.TEAM] = team;
				}
				break;
			case NETWORK_ENTITY.HEALTH:
				with (p) {
					shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = buffer_read(buff, buffer_u8);
					shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] = buffer_read(buff, buffer_u8);
					shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] = buffer_read(buff, buffer_u8);
				}
				break;
			default:
				break;
		}
		break;
	/*case NETWORK_PACKET.KEY:
		var cmd = buffer_read(buff, buffer_u8);
		switch (cmd) {
			case NETWORK_ENTITY.KEY:
				var arr = buffer_read(buff, buffer_u8);
				var k = arr[0];
				var v = arr[1];
				with (p)
					scKeybindsControlsNetwork(true, k, v);
				break;
			default:
				break;
		}
		break;*/
	case NETWORK_PACKET.COMMAND:
		var cmd = buffer_read(buff, buffer_u8);
		switch (cmd) {
			case NETWORK_COMMAND.PLAY:
				global.play = buffer_read(buff, buffer_bool);
				break;
			default:
				break;
		}
		break;
	default:
		break;
}