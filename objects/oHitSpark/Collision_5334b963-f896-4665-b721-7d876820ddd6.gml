if (!damage_done) {
	with (other)
		scHitShootable(other.owner, false, true);
	damage_done = true;
}