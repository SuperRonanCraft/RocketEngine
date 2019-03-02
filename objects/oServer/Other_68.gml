/// @description  Server network control
var eventid = async_load[? "id"];

if( server == eventid )
{
// If the socket ID is the server one, then we have a new 
/// client connecting, OR an old client disconnecting
ConnectDisconnectClient();
}
else if eventid == global.client
{
// Do nothing if this is for our "local" client
}
else
{
// All other sockets are connected client sockets, and we have recieved commands from them.
ServerReceivedData();
}




