/// @desc hit a player
if (damage_done) exit;
with (other)
	scShootableDamage(other, false, true, 1, true);
scShootableKnockback(other, 20, point_direction(x, y, other.x, other.y));
event_user(0);
damage_done = true;