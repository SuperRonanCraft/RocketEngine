
if (!spreading) {
	vsp += grv * owner.time_dialation;
	vsp = clamp(vsp, -32, 32);
	x += hsp * owner.time_dialation;
	y += vsp * owner.time_dialation;
	exit;
} else {
	if (spread_current < spread_range) {
		if (instance_place(x + spread_speed, y, oWall) == noone)
			x += spread_speed;
		spread_current++;
	} else {
		timer--;
		if (timer <= 0)
			instance_destroy();
	}
}