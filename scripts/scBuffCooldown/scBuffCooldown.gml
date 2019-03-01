///@desc The "Cooldowns" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

//define the internal clock
var clock = dsBuff[? BUFF_MAP.CLOCK];

//If the internal clock reaches the time in seconds, expire
if (clock > dsBuff[? BUFF_MAP.TIME]) {
	//Remove NoCooldowns
	scBuffRemove(owner, dsBuff);
} else {
	//Otherwise, the buff is still active, and create a visual indicator
	if (clock % 2 == 0)
		part_particles_create(global.ParticleSystem1, owner.x, owner.y, dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	with (owner) {
		if (current_cd > rocket_map[? ROCKET_MAP.COOLDOWN] / 2)
			current_cd = rocket_map[? ROCKET_MAP.COOLDOWN] / 2;
		if (current_reload > rocket_map[? ROCKET_MAP.RELOAD_TIME] / 2) {
			ammo = rocket_map[? ROCKET_MAP.CLIP];
			current_reload = 0;
		}
	}
	//Also, increaase the clock. Essential for every buff.
	dsBuff[? BUFF_MAP.CLOCK]++;
}