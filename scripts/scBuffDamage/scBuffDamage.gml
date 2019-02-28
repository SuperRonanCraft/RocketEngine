///@desc The "Damage" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock == 0) {
	dsBuff[? "roc_type"] = owner.rocket_map[? ROCKET_MAP.TYPE];
	owner.rocket_map[? ROCKET_MAP.DAMAGE] *= 2;
}

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
	if (owner.rocket_map[? ROCKET_MAP.TYPE] == dsBuff[? "roc_type"])
		owner.rocket_map[? ROCKET_MAP.DAMAGE] /= 2;
	scBuffRemove(owner, dsBuff);
} else {
	if (owner.rocket_map[? ROCKET_MAP.TYPE] != dsBuff[? "roc_type"]) {
		dsBuff[? "roc_type"] = owner.rocket_map[? ROCKET_MAP.TYPE];
		owner.rocket_map[? ROCKET_MAP.DAMAGE] *= 2;
	}
	if (dsBuff[? "parts_crt"] <= 0) {
		part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
			dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
		dsBuff[? "parts_crt"] = dsBuff[? "parts_amt"];
	} else
		dsBuff[? "parts_crt"]--;
	dsBuff[? BUFF_MAP.CLOCK]++;
}