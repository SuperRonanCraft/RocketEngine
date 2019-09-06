/// @desc shot?
event_inherited();

if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 0 && shootable_map[? SHOOTABLE_MAP.CAN_DAMAGE]) {
	with (owner) {
		points++;
		points_scale += 1;
	}
	shootable_map[? SHOOTABLE_MAP.CAN_DAMAGE] = false;
	timer = 0;
	image_index = 1;
}
