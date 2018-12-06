/// @desc Swipe ultimate spawned

//Owner of the ultimate
owner = noone;

swipe_side = false; //false if left, true is right (target)
swipe_current = 0; //The current swipe index
swipe_amt = 2; //How many times to swipe
swipe_speed = 4; //Speed of the swipe
swipe_particle = oParticleHandler.ds_part[? PARTICLES.SLIME]; //Particle
swipe_particle_amt = 20; //Amt of particles to call
swipe_width = 40; //Width of the swipe bar
color = c_purple;

//Will always cover the screen height wise
y1 = 0;
y2 = RES_H;
x1 = x;
x2 = x;

//Fade in animation
fading = true;
fading_time = 30;
//false is fading in, true is out
fading_type = false;
//The alpha that we are at
fading_alpha = 0;

//Maximum alpha
alpha_max = 0.5;
alpha_index = 0.025;