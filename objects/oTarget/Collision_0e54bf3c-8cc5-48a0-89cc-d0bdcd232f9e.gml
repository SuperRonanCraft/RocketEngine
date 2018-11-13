/// @desc touch explosion radius
if (shootable) {
	with (owner) {
		points++;
		points_scale += 1;
	}
	//No sound effect as the score handles that!
	flash = 10;
	shootable = false;
	timer = 10;
}