/// @desc 
hsp = -10;
vsp = -10;
hsp_real = hsp;
vsp_real = vsp;
time_dialation = 1;
grv = 0.6;
weight = 0.6; //lighter the more bounce (1 = no change in inertia) (0 = no bounce) (>1 = more bounce)
friction_base = 0.3; //1 = max fric 0 = none
friction_offset = 10;
timer = 180;
alpha_reduce = 0.04;
stuck_chance = 1 / 5;
stuck = false;

image_xscale /= 2;
image_yscale /= 2;
image_alpha = 0.8;