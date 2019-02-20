if (first_step) exit;

first_step = true;

with (owner) {
	other.x = x
	other.y = y;
	other.image_xscale = facing;
}
