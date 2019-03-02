/// @function				SendKeepAlive(key, state);
/// @description			Send a ping "event" to the server to keep the connection alive

// Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
buffer_seek(buff, buffer_seek_start, 0);

// Write the command into the buffer.
buffer_write(buff, buffer_s16, PING_CMD);

// Send this to the server
var size = network_send_packet(client, buff, buffer_tell(buff));
if size <= 0
{
network_destroy(client);
buffer_delete(buff);
game_restart();
}


