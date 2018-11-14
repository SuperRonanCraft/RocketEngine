///@desc Adds a buff/debuff to an object
///@arg target Object to buff
///@arg name Name of buff
///@arg time Time to expire
///@arg stackable If the buff stacks with itself
///@arg buff If the buff is good for you [1 for buff / -1 for debuff / 0 for neutral]

var targ = argument0;
var name = argument1;
var time = argument2;
var stackable = argument3;
var check = argument4;

//Create the DS Map of the buff
var newBuff = ds_map_create();

//Set up parameter variables.
newBuff[? "name"] = name;
newBuff[? "time"] = time;
newBuff[? "stackable"] = stackable;
newBuff[? "check"] = check;

//Internal clock counting steps from creation
newBuff[? "clock"] = 0;
//Useful for checking when a buff is added, how long until it expires, etc.

//Script for every step (important part)
newBuff[? "stepScript"] = checkBuffStepScript(newBuff, name);
//checkBuffStepScript() applies a specific script depending on the name.
//Check it out for more details.

//If the buff doesn't stack with itself and it isn't in the list, add it to the list
if(!stackable && !findBuff(targ.buffs, newBuff)){
	ds_list_add(targ.buffs, newBuff);
}
//This part is still under construction. For now, stick to non-stacking buffs


