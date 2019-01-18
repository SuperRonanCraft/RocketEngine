if (!other.pickups_enabled || !checked || !global.play) exit;
with (other)
	scRocketChange(other.rocket);
event_inherited();