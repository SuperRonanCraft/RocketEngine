/// @desc toggle devmode
if (!devmode_allow) exit;
global.devmode = !global.devmode;
with (oPlayer)
	damage_take = !global.devmode;