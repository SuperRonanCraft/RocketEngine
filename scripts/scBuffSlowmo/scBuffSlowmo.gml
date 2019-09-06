///@desc The "Slowmo" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock = 0) {
	owner.time_dialation *= dsBuff[? "dialation"];
	owner.image_yscale = owner.grv_dir;
}

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
	var cancel = true;
	var map = dsBuff[? "steps"];
	for (var i = 0; i < ds_list_size(map); i++) {
		var steps = map[| i];
		if (steps[4] > 0) {
			cancel = false;
			break;
		}
	}
	if (cancel) {
		owner.time_dialation /= dsBuff[? "dialation"];
		scBuffRemove(owner, dsBuff);
	}
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
		dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	dsBuff[? BUFF_MAP.CLOCK]++;
	//Matrix effect
	dsBuff[? "steps_crt"]++;
	if (dsBuff[? "steps_amt"] mod dsBuff[? BUFF_MAP.CLOCK] == 0)
		dsBuff[? "steps_max"]--;
	if (dsBuff[? "steps_crt"] >= dsBuff[? "steps_amt"]) {
		dsBuff[? "steps_crt"] = 0;
		var steps = dsBuff[? "steps"];
		if (dsBuff[? "steps_on"] > dsBuff[? "steps_max"])
			dsBuff[? "steps_on"] = 0;
		ds_list_set(steps, dsBuff[? "steps_on"], [x, y, owner.player_map[? PLAYER_MAP.CURRENT_SPRITE], floor(owner.player_map[? PLAYER_MAP.ANIMATION_VAR]), 
			1, facing * image_xscale, image_yscale]);
		dsBuff[? "steps_on"]++;
	}
}