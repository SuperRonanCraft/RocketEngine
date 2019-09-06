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
		var map = weapon_map;
		var rocket_map = map[? WEAPON_MAP.MAP];
		if (map[? WEAPON_MAP.COOLDOWN_TIME] > rocket_map[? ROCKET_MAP.COOLDOWN] / 2)
			map[? WEAPON_MAP.COOLDOWN_TIME] = rocket_map[? ROCKET_MAP.COOLDOWN] / 2;
		if (map[? WEAPON_MAP.RELOAD_TIME] > rocket_map[? ROCKET_MAP.RELOAD_TIME] / 2) {
			map[? WEAPON_MAP.AMMO] = rocket_map[? ROCKET_MAP.CLIP];
			map[? WEAPON_MAP.RELOAD_TIME] = 0;
		}
	}
	//Also, increaase the clock. Essential for every buff.
	dsBuff[? BUFF_MAP.CLOCK]++;
}