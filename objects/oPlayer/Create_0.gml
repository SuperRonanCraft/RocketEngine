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
myweapon = instance_create_depth(x, y, depth - 1, oWeapon);
with (myweapon) {
	owner = other;
}