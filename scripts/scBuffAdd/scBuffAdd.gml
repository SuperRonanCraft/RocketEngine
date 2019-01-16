/// @desc Add a buff type to a shootable
/// @arg buff-type
/// @arg target
/// @arg time* of buff
/// @arg stackable* buff

var buff = argument[0];
var targ = argument[1];
var time = 5;
if (argument_count > 2)
	time = argument[2];
var stackable = false;
if (argument_count > 3)
	stackable = argument[3];

//Add all buffs that were given
if (is_array(buff))
	for (var i = 0; i < array_length_1d(buff); i++)
		scBuffAddList(buff[i], targ, time, stackable);
else 
	scBuffAddList(buff, targ, time, stackable);