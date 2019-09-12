///@desc The "Frozen" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock = 0){	
	owner.player_map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.FROZEN;
	
	dsBuff[? "sliding"] = owner.friction_base / 2;
	owner.friction_adj -= dsBuff[? "sliding"];
}

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? BUFF_MAP.TIME]) {
	owner.player_map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
	owner.player_map[? PLAYER_MAP.ANIMATION_OVERRIDE] = false;
	owner.friction_adj += dsBuff[? "sliding"];	
	//Remove Slime
	scBuffRemove(owner, dsBuff);
} else {
	//Otherwise, the buff is still active, and create a visual indicator
	if (clock % 2 == 0)
		part_particles_create(global.ParticleSystem1, owner.x + irandom_range(-15,15), owner.y, 
			dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	//Also, increase the clock. Essential for every buff.
	dsBuff[? BUFF_MAP.CLOCK]++;
}