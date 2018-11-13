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
var newBuff = ds_map_create();

newBuff[? "name"] = name;
newBuff[? "time"] = time;
newBuff[? "stackable"] = stackable;
newBuff[? "check"] = check;

//Internal clock counting steps from creation
newBuff[? "clock"] = 0;

//Script for every step
newBuff[? "stepScript"] = checkBuffStepScript(newBuff, name);

//If the buff doesn't stack with itself and it isn't in the list, add it to the list
if(!stackable && !findBuff(targ.buffs, newBuff)){
	ds_list_add(targ.buffs, newBuff);
}


