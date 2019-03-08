///@desc The "Absorbtion" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//Add Health
while (owner.hp != dsBuff[? "health_start"] && dsBuff[? "health"] > 0) {
	owner.hp++;
	dsBuff[? "health"]--;
}