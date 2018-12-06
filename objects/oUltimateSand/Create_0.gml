/// @desc Sand Ultimate created!

//Owner of the ultimate
owner = noone;

//Whether we checked the side
checked = false;
//False if left, right is true
side = false; //Target
//Maximum alpha
alpha_max = 0.5;
alpha_index = 0.025;

fading = true;
fading_time = 30;
//false is fading in, true is out
fading_type = false;
//The alpha that we are at
fading_alpha = 0;

//Speed of the cloud
cloud_speed = 5;
cloud_width = 50;
cloud_particle = oParticleHandler.ds_part[? PARTICLES.SAND];
cloud_particle_amt = 50;
color = c_orange;

//Defaults
x = RES_W / 2;
xpos1 = x - cloud_width / 2;
xpos2 = x + cloud_width / 2;