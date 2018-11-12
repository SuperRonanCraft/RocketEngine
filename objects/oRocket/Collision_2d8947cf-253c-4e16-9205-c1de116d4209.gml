/// @desc hit a wall
if (!ignore_wall && other.shootable) {
	instance_change(oHitSpark, true);
	//Move instance to be behind all wall instances
	layer_add_instance(other.layer, id);
	depth += 1;
}