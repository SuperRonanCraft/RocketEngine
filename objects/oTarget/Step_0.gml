/// @desc shot?
event_inherited();

if (hp <= 0 && damage_take) {
	with (owner) {
		points++;
		points_scale += 1;
	}
	damage_take = false;
	timer = 0;
	image_index = 1;
}
