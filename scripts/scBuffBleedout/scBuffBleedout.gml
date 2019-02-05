///@desc The "BleedOut" Buff (Most effective with non damaging rockets)
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff and damage player
	part_emitter_region(global.ParticleSystem1, global.Emitter1, owner.x - 5, owner.x + 5, owner.y + 5, owner.y - 5, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.BLEEDEXPLOSION], 10);	
	scDamageShootable(owner, false, false, 1);
	if (owner.hp <= 0)
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.BLEEDEXPLOSION], 25);	
	scBuffRemove(owner, dsBuff);
} else {
	if(clock < dsBuff[? BUFF_MAP.TIME] * 0.95){
		part_emitter_region(global.ParticleSystem1, global.Emitter1, owner.x - 35, owner.x + 35, owner.y + 35, owner.y - 35, ps_shape_ellipse, ps_distr_invgaussian);
		var amt = dsBuff[? BUFF_MAP.PARTICLE_AMT];
		if (owner.hp <= 1)
			amt *= 5;
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.BLEED], amt);	
	}
		
	dsBuff[? BUFF_MAP.CLOCK]++;
}