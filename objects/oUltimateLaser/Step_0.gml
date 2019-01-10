/// @desc

if (growing) {
	if (width_cur < laser_width)
		width_cur = min(width_cur + laser_grow_speed, laser_width);
	else if (timer < laser_uptime)
		timer++;
	else
		growing = false;
} else if (width_cur > 0)
	width_cur = max(width_cur - laser_grow_speed, 0);
else if (width_cur == 0)
	instance_destroy();

if (damage_cooldown_cur > 0) {
	damage_cooldown_cur--; exit;
} else if (width_cur == laser_width || !growing) { //Full power or fading out, do damage
	var width = width_cur / 2;
	/*var hitting = noone;
	var closest = RES_W; //Closest player to laser
	var list = ds_list_create();

	//Find the closest player
	collision_rectangle_list(x, y - width, x2, y + width, oPlayer, false, false, list, false);
	for (var i = 0; i < ds_list_size(list); i++) {
		var p = list[| i];
		if (p != owner && abs(x - p.x) < closest) //Not the same player as shot
			hitting = p;
	}*/
	with (hitting) {
		scDamageShootable(other, false, false, 1, true);
		other.damage_cooldown_cur = other.laser_damage_cooldown;
	}
	//ds_list_destroy(list);
}