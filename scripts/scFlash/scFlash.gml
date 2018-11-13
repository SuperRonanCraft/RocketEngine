/// @desc flash an object white
/// @arg flash value;
/// @arg face-movement

scDirection(argument1);
if (argument0 > 0) {
	shader_set(shFlash);
	scDirection(argument1);
	shader_reset();
	return argument0 - 1;
} else
	return argument0;