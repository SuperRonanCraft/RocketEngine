/// @description  

owner = noone;

gib = false;

timer = irandom_range(10,60);

angle = 0;
hsp = -10;
vsp = -10;
hsp_real = hsp;
vsp_real = vsp;
time_dialation = 1;
grv = 0.6;
weight = 0.7; //lighter the more bounce (1 = no change in inertia) (0 = no bounce) (>1 = more bounce)
friction_base = 0.3; //1 = max fric 0 = none
friction_offset = 10;
alpha_reduce = 0.04;
stuck_chance = 1 / 5;
stuck = false;
sticky = false;
type = noone;
rotate = false;
bounce_coeff = 0.5;
bleed = noone;
scaled = false; //Should we scale up to normal?
animate = false;
animate_dur = 1;
moving = true;
image_speed = 0;
