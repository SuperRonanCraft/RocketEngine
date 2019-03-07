///@desc The "Sleep" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
	owner.playerMap[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
	owner.playerMap[? PLAYER_MAP.ANIMATION_OVERRIDE] = false;
	scBuffRemove(owner, dsBuff);
} else {
	if (dsBuff[? "parts_crt"] <= 0) {
		part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
			dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
		dsBuff[? "parts_crt"] = dsBuff[? "parts_amt"];
	} else
		dsBuff[? "parts_crt"]--;
	if (owner.playerMap[? PLAYER_MAP.PLAYER_STATE] != PLAYERSTATE.KNOCKBACK)
		if (clock > dsBuff[? BUFF_MAP.TIME] - (10 * TIME_SPEED))
			owner.playerMap[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.WAKING;
		else
			owner.playerMap[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.SLEEPING;
	dsBuff[? BUFF_MAP.CLOCK]++;
}