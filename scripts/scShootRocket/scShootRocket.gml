with (myweapon) {
	if (current_cd == 0) {
		x = other.x;
		y = other.y;
		current_cd = cooldown;
		current_delay = startup;
	}
}