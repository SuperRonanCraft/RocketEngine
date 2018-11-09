/// @desc Move Rocket
//Run special scripts
if (specials != noone)
	script_execute(specials);

x += lengthdir_x(bulletspeed, direction);
y += lengthdir_y(bulletspeed, direction);