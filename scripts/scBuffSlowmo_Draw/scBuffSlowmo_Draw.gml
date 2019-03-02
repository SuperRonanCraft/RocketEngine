///@desc The "Speed" Buff Draw event
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;


var map = dsBuff[? "steps"];
for (var i = 0; i < ds_list_size(map); i++) {
	var steps = map[| i];
	scDrawSpriteExt(steps[0], steps[1], steps[2], steps[3], noone, steps[4], steps[5], steps[6]);
	steps[4] -= 0.05;
	map[| i] = steps;
}