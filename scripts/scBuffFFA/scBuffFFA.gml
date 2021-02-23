///@desc The "FFA" DE-Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
function scBuffFFA(argument0, argument1) {

	var owner = argument0;
	var dsBuff = argument1;

	var clock = dsBuff[? BUFF_MAP.CLOCK];
	if (clock == 0) {
		dsBuff[? "team"] = owner.team;
	}

	if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff
		owner.team = dsBuff[? "team"];
		scRemoveFromTeam(owner, TEAM.NONE);
		scAddToTeam(owner,dsBuff[? "team"])
	
		scBuffRemove(owner, dsBuff);
	} else {
		owner.team = TEAM.NONE;
		scRemoveFromTeam(owner, dsBuff[? "team"]);
		scAddToTeam(owner,TEAM.NONE);
	
		dsBuff[? BUFF_MAP.CLOCK]++;
	
		if(dsBuff[? BUFF_MAP.CLOCK]% 15 == 0){
			part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left-30, bbox_right+30, bbox_top-30, bbox_bottom+30, ps_shape_ellipse, ps_distr_gaussian);
			part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.FFA], 1);
		}
	}


}
