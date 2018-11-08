mywall = instance_create_layer(x, y, layer, oWall);
with (mywall) {
	image_yscale = other.image_yscale;
	image_xscale = other.image_xscale;
	shootable = false;
	owner = other;
}