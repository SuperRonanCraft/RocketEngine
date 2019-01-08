/// @desc

if (growing) {
	if (width_cur < laser_width)
		width_cur = min(width_cur + 1, laser_width);
	else if (timer < laser_uptime)
		timer++;
	else
		growing = false;
} else if (width_cur > 0)
	width_cur = max(width_cur - 1, 0);
else if (width_cur == 0)
	instance_destroy();

if (damage_cooldown_cur > 0) {
	damage_cooldown_cur--; exit;
} else if (width_cur == laser_width || !growing) { //Full power or fading out, do damage
	var width = width_cur / 2;
	var list = ds_list_create();
	collision_rectangle_list(x, y - width, x2, y + width, oPlayer, false, false, list, false);
	for (var i = 0; i < ds_list_size(list); i++) {
		var p = list[| i];
		if (p != owner) //Not the same player as shot
			with (p) {
				scDamageShootable(other, false, false, 1, true);
				other.damage_cooldown_cur = other.laser_damage_cooldown;
			}
	}
	ds_list_destroy(list);
}