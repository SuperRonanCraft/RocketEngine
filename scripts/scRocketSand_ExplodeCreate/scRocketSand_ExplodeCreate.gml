/// @desc a sand rockets explosion create event
/// @arg explosion-instance
function scRocketSand_ExplodeCreate(argument0) {

	with (argument0) {
		destroy = false;
		sand = ds_map_create();
		ds_map_add(sand, "timer", 10 * room_speed);
		ds_map_add(sand, "clock", 0);
		ds_map_add(sand, "size", 10);
	}




}
