/// @desc a sand rockets explosion create event
/// @arg explosion-instance

with (argument0) {
	var wall = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, oWall, false, true);
	intercept = ds_map_create();
	if (wall == noone || wall.is_wall) {ds_map_add(intercept, "cancelled", true); exit;} //No wall? Delete the explosion
	destroy = false;
	ds_map_add(intercept, "timer", 10 * room_speed);
	ds_map_add(intercept, "clock", 0);
	ds_map_add(intercept, "wall", wall);
}

