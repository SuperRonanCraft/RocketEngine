/// @desc hit a player
if (!damage) exit;
with (other)
	scDamageShootable(other, false, true, 1);
if (other.object_index == oPlayer)
	scKnockbackGive(other, 20, point_direction(x, y, other.x, other.y));
event_user(0);
damage = false;