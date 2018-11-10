/// @desc Move Rocket
//Run special scripts
x += lengthdir_x(bulletspeed, direction);
y += lengthdir_y(bulletspeed, direction);

if (timer > 0)
	timer--;
else if (timer == 0)
	instance_change(oHitSpark, true);