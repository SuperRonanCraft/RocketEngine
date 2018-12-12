if(homingClock > 35){
	targetLocX = target.x + irandom_range(-30,30);
	targetLocY = target.y + irandom_range(-30,30);
}

if (target != noone) {
	var dir = point_direction(x, y, targetLocX, targetLocY); //Direction to target
	var diff = angle_difference(dir, direction); //The difference between the rocket direction and target direction
	if (abs(diff) < 270) {
		
		if(homingClock > 25)
			direction += clamp(diff, -5, 5); //Slowly rotate the rocket
		
		image_angle = direction;
	}
} else
	for (var i = 0; i < instance_number(oPlayer); i += 1)
		if (instance_find(oPlayer, i) != owner)
			target = instance_find(oPlayer, i);
x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);

rocket_map[? ROCKET_MAP.SPEED] += 0.2;

homingClock++;