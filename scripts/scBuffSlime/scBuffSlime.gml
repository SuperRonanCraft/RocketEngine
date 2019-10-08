///@desc The "Slime" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock = 0) {
	var g_map = owner.gravity_map;
	dsBuff[? "jump"] = g_map[? GRAVITY_MAP.JUMP_HEIGHT] * 0.25;
	g_map[? GRAVITY_MAP.JUMP_MOD] -= dsBuff[? "jump"];
}

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? BUFF_MAP.TIME]) {
	var g_map = owner.gravity_map;
	g_map[? GRAVITY_MAP.JUMP_MOD] += dsBuff[? "jump"];	
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