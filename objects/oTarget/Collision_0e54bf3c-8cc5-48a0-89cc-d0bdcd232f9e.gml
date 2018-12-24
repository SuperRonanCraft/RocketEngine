/// @desc touch explosion radius
if (shootable) {
	with (owner) {
		points++;
		points_scale += 1;
	}
	//No sound effect as the score handles that!
	shootable = false;
	image_alpha -= 0.15;
	alpha_reduction = 0.15;
	timer = 0;
	image_index = 1;
}