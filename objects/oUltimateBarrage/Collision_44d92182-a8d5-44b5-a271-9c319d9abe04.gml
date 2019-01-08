/// @desc hit a player
if (!damage) exit;
with (other)
	scDamageShootable(other, false, true, 1);
event_user(0);
damage = false;