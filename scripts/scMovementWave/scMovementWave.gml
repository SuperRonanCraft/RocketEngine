/// @desc Wave betweem two variables over time
/// @arg from minimum
/// @arg to max
/// @arg duration amount of time
/// @arg offset 

var val = (argument1 - argument0) * 0.5;
return argument0 + val + sin((((current_time * 0.001) + argument2 * argument3) / argument2) * (pi * 2)) * val;