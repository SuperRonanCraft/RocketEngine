/// @desc

if (growing) {
	if (width_cur < laser_width)
		width_cur = min(width_cur + laser_grow_speed, laser_width);
	else if (timer < laser_uptime)
		timer++;
	else
		growing = false;
} else if (width_cur > 0) //Shrink
	width_cur = max(width_cur - laser_grow_speed, 0);
else if (width_cur == 0) //Destroy
	instance_destroy();

if (damage_cooldown_cur > 0) { //Just did damage? Cooldown
	damage_cooldown_cur--; exit;
} else if (width_cur == laser_width || !growing) { //Full power or fading out, do damage
	var width = width_cur / 2;
	with (hitting) {
		scDamageShootable(other.owner, id, false, false, 1);
		other.damage_cooldown_cur = other.laser_damage_cooldown;
	}
}