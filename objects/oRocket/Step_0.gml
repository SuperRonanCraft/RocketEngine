/// @desc Move Rocket
//Run special scripts
x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);


if (timer > 0)
	timer--;
else if (timer == 0)
	event_user(0);

if (x > RES_W + 20 || x < -20 || y > RES_H || y < -20)
	event_user(0);
	
if (destroy)
	//If the rocket needs to check an instance (like another rocket)
	//collideRocket is set to 1 to destroy AFTER the checks are done
	if (collideRocket > 0)
		collideRocket--;	
	else
		instance_destroy();