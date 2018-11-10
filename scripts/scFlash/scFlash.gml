/// @desc flash an object white
/// @arg flash value;
scDirection();
if (argument0 > 0) {
	shader_set(shFlash);
	scDirection();
	shader_reset();
	return argument0 - 1;
} else
	return argument0;