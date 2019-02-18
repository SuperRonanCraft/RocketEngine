///@desc The "Slowmo" Buff (Most effective with non damaging rockets)
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
	owner.playerState = PLAYERSTATE.NORMAL;
	owner.overrideAnimation = false;
	scBuffRemove(owner, dsBuff);
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
		dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	if (playerState != PLAYERSTATE.KNOCKBACK)
		if (clock > dsBuff[? BUFF_MAP.TIME] - (10 * TIME_SPEED))
			owner.playerState = PLAYERSTATE.WAKING;
		else
			owner.playerState = PLAYERSTATE.SLEEPING;
	dsBuff[? BUFF_MAP.CLOCK]++;
}