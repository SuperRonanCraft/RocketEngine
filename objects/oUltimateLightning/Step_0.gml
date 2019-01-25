/// @desc 

if (!stopped) {
	if (light_current > light_target / 2) {
		light_speed = ((light_target / light_current) - 1) * light_speed;
	}

	if (light_current < light_target && light_speed > 2) {
		x += lengthdir_x(light_speed, direction);
		y += lengthdir_y(light_speed, direction);
		light_current += light_speed;
	} else
		stopped = true;
} else {
	if (timer <= 0)
		instance_destroy();
	else
		timer--;
}

//STRIKE ENEMY
striking = noone;
var amt = instance_number(oPlayer);
for (var i = 0; i < amt; i++) {
	var p = instance_find(oPlayer, i);
	if (p != noone && p.team != owner.team)
		if (point_distance(x, y, p.x, p.y) <= light_range) {
			striking = p;
			break;
		}
}