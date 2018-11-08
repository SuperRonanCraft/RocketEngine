/// @desc Create
facing = 1;
global.players++;
playerid = global.players;
scGravityStart();
scKeybindsSet(global.players);
event_inherited();
display = DISPLAYTYPE.SCREEN;
if (playerid == 1)
	side = SIDE.LEFT;
else
	side = SIDE.RIGHT;