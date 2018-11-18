/// @desc Explosion
var xplo = instance_create_depth(x, y, 10, oExplosion);
xplo.sprite_index = rocket_map[? ROCKET_MAP.EXPLOSION_SPRITE];
xplo.image_speed = 1.5;
xplo.image_xscale = size;
xplo.image_yscale = size;
xplo.parent = owner;
xplo.buff = rocket_map[? ROCKET_MAP.BUFF];
var part = rocket_map[? ROCKET_MAP.PARTICLE_EXPLOSION];
//All variables before this should be standard for all rockets. The one difference typically lies here:
//xplo.stepScript = scRocketSpecialIce_ExplosionStep;
//This script describes how the explosion behaves. It is essential, otherwise it will not do anything.
//Check the above script for more details.

//Particle explosion to look pretty.
if (part != noone) {
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - (1*30), x + (1*30), y - (1*10), y + (1*10), ps_shape_ellipse, ps_distr_gaussian)
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, 15*1);
}
instance_destroy();