///@desc The "AntiHeal" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock == 0)
	owner.shootable_map[? SHOOTABLE_MAP.CAN_HEAL] = false;

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
	owner.shootable_map[? SHOOTABLE_MAP.CAN_HEAL] = true;
	scBuffRemove(owner, dsBuff);
} else {
	part_particles_create(global.ParticleSystem1, x + irandom_range(-25, 25), y + irandom_range(-30, 30), 
		dsBuff[? BUFF_MAP.PARTICLE], dsBuff[? BUFF_MAP.PARTICLE_AMT]);
	//Change scale
	dsBuff[? "scale"] = clamp(dsBuff[? "scale"] + (dsBuff[? "scale_chg"] * dsBuff[? "scale_dir"]), 
		dsBuff[? "scale_org"] - dsBuff[? "scale_lmt"], dsBuff[? "scale_org"] + dsBuff[? "scale_lmt"]);
	//Change scale direction
	if (dsBuff[? "scale"] >= dsBuff[? "scale_org"] + dsBuff[? "scale_lmt"] || dsBuff[? "scale"] <= dsBuff[? "scale_org"] + (dsBuff[? "scale_lmt"] * -1))
		dsBuff[? "scale_dir"] *= -1;
	
	//if (owner.display)
	//	with (owner)
			//for (var i = 0; i < shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] / 2 && i < 10; i++) {
				/*var len = hpwidth * i;
				var side = team == TEAM.LEFT ? 1 : -1;
				var xpos = (side == 1 ? 20 + len : RES_W - 20 - len) + hp_offset;
				var ypos = hpheight + 2;
				var scale = i * 2 <= shootable_map[? SHOOTABLE_MAP.HEALTH] + (player_map[? PLAYER_MAP.DAMAGE_LAST] - 1) && i * 2 > shootable_map[? SHOOTABLE_MAP.HEALTH] - 2 ? hp_scale : 1;
				scFlash(dsBuff[? "alpha"], dsBuff[? "color"], scale + dsBuff[? "scale"], scale + dsBuff[? "scale"], hpsprite, shootable_map[? SHOOTABLE_MAP.HEALTH] > i ? 0 : 1, xpos, ypos);
			*/
			//}
		
	dsBuff[? BUFF_MAP.CLOCK]++;
}