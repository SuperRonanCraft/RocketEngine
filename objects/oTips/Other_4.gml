/// @desc restart timer

var rooms = [rMenu, r1v1Select, rvTargetSelect, rKnockOutSelect, rRumbleSelect];
var inRoom = false;
for (var i = 0; i < array_length_1d(rooms); i++)
	if (room == rooms[i]) {inRoom = true; break;}
if (!inRoom)
	event_user(0);