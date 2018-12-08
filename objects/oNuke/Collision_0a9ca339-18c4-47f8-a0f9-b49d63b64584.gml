/// @desc hit a player
if (damage_done) exit;
with (other)
	scHitShootable(other, false, true, 1, true);
event_user(0);
damage_done = true;