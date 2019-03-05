///@desc The "Life-Steal" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;
var arry = argument2;

var inst = arry[0];
var dmg = arry[1];

if (canHeal) {
	repeat (dmg)
		if (hp + 1 <= hp_original)
			hp++;
	hp_scale += 2;
}