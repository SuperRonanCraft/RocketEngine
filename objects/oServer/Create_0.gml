/// @description  Create server and initialise map

global.counter = 0;
image_blend = c_red;
global.haveserver = true;

// List of random player colours....
ColourArray[0] = c_white;
ColourArray[1] = c_red;
ColourArray[2] = c_blue;
ColourArray[3] = c_yellow;
ColourArray[4] = c_green;
ColourArray[5] = c_purple;
ColourArray[6] = c_aqua;
ColourArray[7] = c_maroon;
ColourArray[8] = c_orange;
ColourArray[9] = c_teal;
ColourArray[10] = c_olive;
ColourArray[11] = c_ltgray;
ColourArray[12] = c_dkgray;
ColourArray[13] = c_navy;
ColourArray[14] = $ff8080;
ColourArray[15] = $80ff80;
colourindex = 0;

// Total number of players and baddies connected
global.PlayerTotal = 0;
global.BaddieCount = 0;


// Create our server. Server creation may fail if there is already a server running. If it does fail, delete eveything and kill this instance
broadcast_buffer = buffer_create(32, buffer_fixed, 1);
player_buffer = buffer_create(16384, buffer_fixed, 1);
Clients = ds_map_create();
socketlist = ds_list_create();

// Try and create the actual server
server = network_create_server(global.ServerType, 6510, 32);
if server < 0
{    
// If theres already a server running, shut down and delete.
global.haveserver = false;
ds_map_destroy(Clients);
ds_list_destroy(socketlist);
buffer_delete(broadcast_buffer);
buffer_delete(player_buffer);
instance_destroy();
}

// Setup a timer so we can broadcast the server IP out to local clients looking...
alarm[0] = room_speed; 



