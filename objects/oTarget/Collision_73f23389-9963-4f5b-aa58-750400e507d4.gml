/// @desc hit add score
if (shootable) {
	with (other)
		instance_change(oHitSpark, true);
	with (owner)
		points++;
	flash = 10;
	shootable = false;
	timer = 10;
}