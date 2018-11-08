mywall = instance_create_layer(bbox_left, bbox_top, layer, oWall);
with (mywall) {
	image_yscale = other.image_yscale;
	image_xscale = other.image_xscale;
	shootable = false;
	owner = other;
}