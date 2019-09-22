/// @desc Add a buff type to a shootable
/// @arg buff-type
/// @arg target
/// @arg given-by
/// @arg time* of buff

var buff = argument[0];
var targ = argument[1];
var from = argument[2];
var time = argument_count > 3 ? (argument[3] != noone ? argument[3] : noone) : noone;

//Add all buffs that were given
if (is_array(buff))
	for (var i = 0; i < array_length_1d(buff); i++)
		scBuffApply(buff[i], targ, from, time);
else 
	scBuffApply(buff, targ, from, time);