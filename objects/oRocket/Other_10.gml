/// @desc Explosion
var xplo = instance_create_depth(x, y, 10, oExplosion);
xplo.sprite_index = rocket_map[? ROCKET_MAP.EXPLOSION_SPRITE];
xplo.image_speed = 1.5;
xplo.image_xscale = size;
xplo.image_yscale = size;
xplo.parent = owner;
ds_map_copy(xplo.rocket_map, rocket_map);
ds_list_copy(xplo.confirmList, hitList);
var part = rocket_map[? ROCKET_MAP.PARTICLE_EXPLOSION];
//All variables before this should be standard for all rockets. The one difference typically lies here:
//xplo.stepScript = scRocketSpecialIce_ExplosionStep;
//This script describes how the explosion behaves. It is essential, otherwise it will not do anything.
//Check the above script for more details.

//Particle explosion to look pretty.
if (part != noone) {
	var scale = rocket_map[? ROCKET_MAP.SCALE];
	part_emitter_region(global.ParticleSystem1, global.Emitter1, x - (30 * scale), x + (30 * scale), 
		y - (30 * scale), y + (30 * scale), ps_shape_ellipse, ps_distr_gaussian)
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, part, (50 * scale));
}
scScreenShake(rocket_map[? ROCKET_MAP.SHAKE_MAGNITUDE], rocket_map[? ROCKET_MAP.SHAKE_FRAMES]);
//Delete this instance of oRocket

with (xplo) //Custom create event for rocket
	if (rocket_map[? ROCKET_MAP.EXPLOSION_CREATE] != noone)
		script_execute(rocket_map[? ROCKET_MAP.EXPLOSION_CREATE]);

destroy = true;
scPlaySound(rocket_map[? ROCKET_MAP.SOUND_EXPLOSION]);