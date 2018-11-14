///@desc Ice rocket explosion
///@arg size
///@arg [friendlyFire]

var size = argument[0];
var friendlyFire = false;

//The second paramater is not needed, but if defined it won't break the code.
if(argument_count > 1){
	friendlyFire = argument[1];	
}

//Create a separate explosion object on this rocket's origins.

var xplo = instance_create_depth(x,y,10,oExplosion);

xplo.sprite_index = sexplosion_Ice;
xplo.image_xscale = size;
xplo.image_yscale = size;
xplo.image_speed = 1.5;
xplo.parent = owner;
xplo.friendlyFire = friendlyFire;

//All variables before this should be standard for all rockets. The one difference typically lies here:
xplo.stepScript = scRocketSpecialIce_ExplosionStep;
//This script describes how the explosion behaves. It is essential, otherwise it will not do anything.
//Check the above script for more details.

//Particle explosion to look pretty.
part_emitter_region(global.ParticleSystem1,global.Emitter1,x-(size*30),x+(size*30),y- (size*10),y+(size*10),ps_shape_ellipse,ps_distr_gaussian)
part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.partIce,15);

sprite_index = noone;

destroy = true;

//This script CREATES the explosion object, and tells the rocket it can be destroyed.
