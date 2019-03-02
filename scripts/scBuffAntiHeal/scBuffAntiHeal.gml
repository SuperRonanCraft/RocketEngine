///@desc The "AntiHeal" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock == 0) {
	dsBuff[? "color"] = owner.hp_color_outline;
	owner.hp_color_outline = c_purple;
	owner.canHeal = false;
	dsBuff[? "scale_player"] = owner.hp_color_outline_scale;
	dsBuff[? "scale_org"] = 0.3;
	dsBuff[? "scale_lmt"] = 0.1;
	dsBuff[? "scale_chg"] = 0.01;
	dsBuff[? "scale_dir"] = 1;
	dsBuff[? "scale"] = dsBuff[? "scale_org"];
}

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
	owner.hp_color_outline = dsBuff[? "color"];
	owner.hp_color_outline_scale = dsBuff[? "scale_player"];
	owner.canHeal = true;
	scBuffRemove(owner, dsBuff);
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-25, 25), y + irandom_range(-30, 30), 
		dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	owner.hp_color_outline_scale = dsBuff[? "scale"];
	//Change scale
	dsBuff[? "scale"] = clamp(dsBuff[? "scale"] + (dsBuff[? "scale_chg"] * dsBuff[? "scale_dir"]), 
		dsBuff[? "scale_org"] - dsBuff[? "scale_lmt"], dsBuff[? "scale_org"] + dsBuff[? "scale_lmt"]);
	//Change scale direction
	if (dsBuff[? "scale"] >= dsBuff[? "scale_org"] + dsBuff[? "scale_lmt"] || dsBuff[? "scale"] <= dsBuff[? "scale_org"] + (dsBuff[? "scale_lmt"] * -1))
		dsBuff[? "scale_dir"] *= -1;
	dsBuff[? BUFF_MAP.CLOCK]++;
}