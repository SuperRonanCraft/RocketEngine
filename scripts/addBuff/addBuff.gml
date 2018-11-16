///@desc Adds a buff/debuff to an object
///@arg target Object to buff
///@arg name Name of buff
///@arg time Time to expire
///@arg stackable If the buff stacks with itself
///@arg buff If the buff is good for you [1/-1/0 buff/debuff/neutral]


var targ = argument[0];
var name = argument[1];
var time = argument[2];
var stackable = argument[3];
var check = argument[4];

//Create the DS Map of the buff
var newBuff = ds_map_create();

//Set up parameter variables.
newBuff[? "name"] = name;
newBuff[? "time"] = time*game_get_speed(gamespeed_fps);
newBuff[? "stackable"] = stackable;
newBuff[? "check"] = check;

//Internal clock counting steps from creation
newBuff[? "clock"] = 0;
//Useful for checking when a buff is added, how long until it expires, etc.

//Icon for name of buff
newBuff[? "icon"] = checkIconSprite(newBuff, name);

//Script for every step (important part)
newBuff[? "stepScript"] = checkBuffStepScript(newBuff, name);
//checkBuffStepScript() applies a specific script depending on the name.
//Check it out for more details.

//If the buff doesn't stack with itself and it isn't in the list, add it to the list
if(!stackable && !findBuff(targ.buffs, newBuff[?"name"])){
	ds_list_add(targ.buffs, newBuff);
}
//This part is still under construction. For now, stick to non-stacking buffs


