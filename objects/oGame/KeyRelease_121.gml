/// @desc toggle devmode
if (!devmode_allow) exit;
global.devmode = !global.devmode;
with (oPlayer)
	shootable_map[? SHOOTABLE_MAP.CAN_DAMAGE] = !global.devmode;