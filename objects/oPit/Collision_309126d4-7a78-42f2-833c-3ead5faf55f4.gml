/// @desc touching a player

with (other)
	if (hp > 0)
		scDamageShootable(other, false, false, 1, true);