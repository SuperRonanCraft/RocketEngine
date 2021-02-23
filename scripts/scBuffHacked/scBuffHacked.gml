///@desc The "Hacked" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
function scBuffHacked(argument0, argument1) {

	var owner = argument0;
	var dsBuff = argument1;

	var clock = dsBuff[? BUFF_MAP.CLOCK];

	if (clock = 0) {
		dsBuff[? "toggleUlt"] = owner.ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED];
		if (dsBuff[? "toggleUlt"])
			owner.ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED] = false;
		dsBuff[? "toggleRoc"] = owner.weapon_map[? WEAPON_MAP.ENABLED];
		if (dsBuff[? "toggleRoc"])
			owner.weapon_map[? WEAPON_MAP.ENABLED] = false;
		dsBuff[? "togglePic"] = owner.player_map[? PLAYER_MAP.ENABLED_PICKUP];
		if (dsBuff[? "togglePic"])
			owner.player_map[? PLAYER_MAP.ENABLED_PICKUP] = false;
	}

	if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff and damage player
		if (dsBuff[? "toggleUlt"])
			owner.ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED] = true;
		if (dsBuff[? "toggleRoc"])
			owner.weapon_map[? WEAPON_MAP.ENABLED] = true;
		if (dsBuff[? "togglePic"])
			owner.player_map[? PLAYER_MAP.ENABLED_PICKUP] = true;
		scBuffRemove(owner, dsBuff);
	} else {
		part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
			dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
		dsBuff[? BUFF_MAP.CLOCK]++;
	}


}
