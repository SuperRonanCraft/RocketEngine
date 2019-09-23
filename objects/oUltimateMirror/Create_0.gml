/// @desc Reflect ult has been summoned

//Owner of the ult
owner = noone;

//Edittable
mirror_speed = 5 / (room_speed / 30);
mirror_height = sprite_height / 2;
mirror_particle = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
mirror_particle_amt = 5;
mirror_bounces = 3;
y = -sprite_height / 2;

//Calculations
dropping = true;
bounces = 0;
inroom = false;
leaving = false;

//Uptime
timer = 120;