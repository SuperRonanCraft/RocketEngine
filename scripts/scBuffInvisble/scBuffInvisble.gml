///@desc The "Invisible" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];
if (clock == 0) {
	owner.player_map[? PLAYER_MAP.HUD_SHOW] = false;
	owner.ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_SHOW] = false;
}

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
	owner.image_alpha = 1;
	owner.player_map[? PLAYER_MAP.HUD_SHOW] = true;
	owner.ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_SHOW] = true;
	scBuffRemove(owner, dsBuff);
} else {
	owner.image_alpha = 0;
	dsBuff[? BUFF_MAP.CLOCK]++;
}