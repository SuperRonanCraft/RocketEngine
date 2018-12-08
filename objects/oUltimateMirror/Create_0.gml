/// @desc Reflect ult has been summoned

//Owner of the ult
owner = noone;

//Edittable
mirror_speed = 8;
mirror_width = 10;
mirror_color = c_silver;
mirror_alpha = 0.5;
mirror_particle = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
mirror_particle_amt = 20
y = 0;

//Calculations
xpos1 = x - mirror_width;
xpos2 = x + mirror_width;
dropping = true;

//Uptime
timer = 120;