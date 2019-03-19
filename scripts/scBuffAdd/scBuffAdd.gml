/// @desc Add a buff type to a shootable
/// @arg buff-type
/// @arg target
/// @arg given-by
/// @arg time* of buff
/// @arg stackable* buff


var buff = argument[0];
var targ = argument[1];
var from = argument[2];
var time = 5;
if (argument_count > 3)
	time = argument[3];
var stackable = false;
if (argument_count > 4)
	stackable = argument[4];

//Add all buffs that were given
if (is_array(buff))
	for (var i = 0; i < array_length_1d(buff); i++)
		scBuffApply(buff[i], targ, from, time, stackable);
else 
	scBuffApply(buff, targ, from, time, stackable);