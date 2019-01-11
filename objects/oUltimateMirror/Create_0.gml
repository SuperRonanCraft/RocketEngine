/// @desc Reflect ult has been summoned

//Owner of the ult
owner = noone;

//Edittable
mirror_speed = 5;
//mirror_width = 20;
//mirror_color = c_silver;
mirror_alpha = 0.5;
mirror_height = sprite_height / 2;
mirror_particle = oParticleHandler.ds_part[? PARTICLES.SPARKLE];
mirror_particle_amt = 5;
mirror_bounces = 3;
y = -sprite_height / 2;

//Calculations
//xpos1 = x - (mirror_width / 2);
//xpos2 = x + (mirror_width / 2);
dropping = true;
bounces = 0;
inroom = false;
leaving = false;

//Uptime
timer = 120;