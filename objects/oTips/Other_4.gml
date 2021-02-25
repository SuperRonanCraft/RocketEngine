/// @desc restart timer

var rooms = [rMenu];
var inRoom = false;
for (var i = 0; i < array_length(rooms); i++)
	if (room == rooms[i]) {inRoom = true; break;}
if (!inRoom)
	event_user(0);