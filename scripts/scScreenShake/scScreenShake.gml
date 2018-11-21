/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude set the strenght of the shake (radius)
/// @arg Frames sets the lenght of the shake in frames

with (oCamera)
	if (argument0 > shake_remain){
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_lenght = argument1;
	}