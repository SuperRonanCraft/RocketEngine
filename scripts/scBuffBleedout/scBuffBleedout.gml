///@desc The "BleedOut" Buff (Most effective with non damaging rockets)
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map

var owner = argument0;
var dsBuff = argument1;

var clock = dsBuff[? BUFF_MAP.CLOCK];
var dmg = 2;

if (clock > dsBuff[? BUFF_MAP.TIME]) { //Remove debuff and damage player
	part_emitter_region(global.ParticleSystem1, global.Emitter1, owner.x - 5, owner.x + 5, owner.y + 5, owner.y - 5, 
		ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.BLEEDEXPLOSION], 10);
	if (dsBuff[? BUFF_MAP.GIVEN_BY] != noone && scBuffFind(dsBuff[? BUFF_MAP.GIVEN_BY], BUFFTYPE.DAMAGE))
		dmg *= 2;
	scDamageShootable(dsBuff[? BUFF_MAP.GIVEN_BY], owner, false, false, dmg);
	if (owner.shootable_map[? SHOOTABLE_MAP.HEALTH] <= 0)
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.BLEEDEXPLOSION], 25);	
	scBuffRemove(owner, dsBuff);
} else {
	if(clock < dsBuff[? BUFF_MAP.TIME] * 0.95){
		part_emitter_region(global.ParticleSystem1, global.Emitter1, owner.x - 35, owner.x + 35, owner.y + 35, owner.y - 35, ps_shape_ellipse, ps_distr_invgaussian);
		var amt = dsBuff[? BUFF_MAP.PARTICLE_AMT];
		if (owner.shootable_map[? SHOOTABLE_MAP.HEALTH] <= dmg)
			amt *= 5;
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.BLEED], amt);	
	}
	dsBuff[? BUFF_MAP.CLOCK]++;
}