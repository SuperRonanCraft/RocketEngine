/// @arg speed
/// @arg direction
function scMovementLine(argument0, argument1) {

	var dir = argument1;
	var spd = argument0 * owner.time_dialation;
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);


}
