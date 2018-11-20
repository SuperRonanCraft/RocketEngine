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

xplo.sprite_index = sexplosion_Fire;
xplo.image_xscale = size;
xplo.image_yscale = size;
xplo.image_speed = 1.5;
xplo.parent = owner;
ds_map_copy(xplo.rocket_map, rocket_map);
//xplo.friendlyFire = friendlyFire;

//All variables before this should be standard for all rockets. The one difference typically lies here:
//xplo.stepScript = scRocketSpecialFire_ExplosionStep;
//instance_destroy();
part_emitter_region(global.ParticleSystem1,global.Emitter1,x-(size*30),x+(size*30),y- (size*10),y+(size*10),ps_shape_ellipse,ps_distr_gaussian);
part_emitter_burst(global.ParticleSystem1,global.Emitter1,oParticleHandler.ds_part[? PARTICLES.EMBER],15*size);
scScreenShake(rocket_map[? ROCKET_MAP.SHAKE_MAGNITUDE], rocket_map[? ROCKET_MAP.SHAKE_FRAMES]);
sprite_index = noone;

destroy = true;

