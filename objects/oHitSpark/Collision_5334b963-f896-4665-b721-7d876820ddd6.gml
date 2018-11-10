if (!damage_done) {
	with (other)
		scHitShootable(other.owner, false);
	damage_done = true;
}