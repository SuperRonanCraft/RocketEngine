///@desc The "Absorbtion" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
///@arg extras [DAMAGING, DMG]

var owner = argument[0];
var dsBuff = argument[1];
var extra = argument[2];

//Add Health
scShootableHeal(owner, extra[1], false, false);
dsBuff[? "health"] -= extra[1];
/*while (owner.shootable_map[? SHOOTABLE_MAP.HEALTH] != dsBuff[? "health_start"] && dsBuff[? "health"] > 0) {
	owner.shootable_map[? SHOOTABLE_MAP.HEALTH]++;
	dsBuff[? "health"]--;
}