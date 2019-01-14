/// @desc shot?
event_inherited();

if (hp <= 0 && damage_take) {
	//Bomb sound effect
	with (shooter)
		scDamageShootable(other, false, false, 1);
	with (owner) {
		points++;
		points_scale += 1;
	}
	damage_take = false;
	timer = 0;
	image_index = 1;
}
