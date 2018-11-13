///@desc Ice rocket explosion
///@arg size

var size = argument0;

var xplo = instance_create_depth(x,y,10,oExplosion);

xplo.sprite_index = sexplosion_Ice;
xplo.image_xscale = size;
xplo.image_yscale = size;
xplo.image_speed = 1.5;
xplo.parent = owner;
xplo.stepScript = scRocketSpecialIce_ExplosionStep;

part_emitter_region(global.ParticleSystem1,global.Emitter1,x-(size*10),x+(size*10),y- (size*10),y+(size*10),ps_shape_ellipse,ps_distr_gaussian)
part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.partIce,15);

sprite_index = noone;

destroy = true;