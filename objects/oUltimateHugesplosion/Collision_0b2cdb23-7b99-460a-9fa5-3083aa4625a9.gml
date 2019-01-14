/// @desc damage enemy
if (owner.team != other.team)
	if (!exploded && !spawned)
		exploding = true;
/*if (other != owner)
	if (ds_list_find_index(damage_list, other) == -1) {
		ds_list_add(damage_list, other);
		with (other)
			scDamageShootable(other, false, false, other.damage, false);
		doKnockback(other, 30, point_direction(x, y, other.x, other.y));
	}
