/// @desc Move Rocket
//Run special scripts
x += lengthdir_x(bulletspeed, direction);
y += lengthdir_y(bulletspeed, direction);


if (timer > 0)
	timer--;
else if (timer == 0)
	instance_change(oHitSpark, true);

if (x > RES_W + 20 || x < -20 || y > RES_H || y < -20)
	instance_change(oHitSpark, true);