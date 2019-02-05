/// @description Insert description here
// You can write your code in this editor
global.timeDialationEnabled = !global.timeDialationEnabled;

if (global.timeDialationEnabled)
	with (oPlayer)
		time_dialation = 0.5;
else
	with (oPlayer)
		time_dialation = 1;