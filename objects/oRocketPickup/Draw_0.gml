/// @desc Check if touching wall or another pickup, delete if so
if (!checked) {
	if (place_meeting(x, y, oWall) || place_meeting(x, y, oRocketPickup))
		instance_destroy();
	checked = true;
}
draw_self();