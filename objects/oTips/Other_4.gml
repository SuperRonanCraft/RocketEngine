/// @desc restart timer

var rooms = [rMenu, global.gamemodeSRoom[GAMEMODE.ONEVONE], global.gamemodeSRoom[GAMEMODE.TARGETS],
	global.gamemodeSRoom[GAMEMODE.KNOCKOUT], global.gamemodeSRoom[GAMEMODE.SINGLE]];
var inRoom = false;
for (var i = 0; i < array_length_1d(rooms); i++)
	if (room == rooms[i]) {inRoom = true; break;}
if (!inRoom)
	event_user(0);