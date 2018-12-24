/// @desc hit add score
if (shootable) {
	with (other)
		event_user(0);
	with (owner) {
		points++;
		points_scale += 1;
	}
	//No sound effect as the score handles that!
	shootable = false;
	timer = 0;
	image_index = 1;
}