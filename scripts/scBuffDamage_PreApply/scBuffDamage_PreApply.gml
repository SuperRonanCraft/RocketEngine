///@desc The "Damage" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
function scBuffDamage_PreApply() {

	//var owner = argument0;
	//var dsBuff = argument1;
	var dmg = argument[2];

	//var clock = dsBuff[? BUFF_MAP.CLOCK];

	return dmg * 2;

	/*var map = owner.weapon_map;
	if (clock == 0) {
		dsBuff[? "wep_type"] = map[? WEAPON_MAP.TYPE];
		map[? WEAPON_MAP.DAMAGE] *= 2;
	}*/

	/*if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
		if (map[? WEAPON_MAP.TYPE] == dsBuff[? "wep_type"])
			map[? WEAPON_MAP.DAMAGE] /= 2;
		scBuffRemove(owner, dsBuff);
	} else {
		if (map[? WEAPON_MAP.TYPE] != dsBuff[? "wep_type"]) {
			dsBuff[? "wep_type"] = map[? WEAPON_MAP.TYPE];
			map[? WEAPON_MAP.DAMAGE] *= 2;
		}
		if (dsBuff[? "parts_crt"] <= 0) {
			part_particles_create(global.ParticleSystem1, x + irandom_range(-10, 10), y + irandom_range(-15, 15), 
				dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
			dsBuff[? "parts_crt"] = dsBuff[? "parts_amt"];
		} else
			dsBuff[? "parts_crt"]--;
		dsBuff[? BUFF_MAP.CLOCK]++;
	}

/* end scBuffDamage_PreApply */
}
