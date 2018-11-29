/// @desc touching a player

with (other)
	if (hp > 0)
		scHitShootable(other, false, false, 1);