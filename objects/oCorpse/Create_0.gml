/// @description  

owner = noone;

gib = false;
slice = false;
gibID = 0;

timer = irandom_range(120,240);

corpseMap = ds_map_create();
playerMap = ds_map_create();

currentSprite = sprite_index;
animationVar = 0;
specialAnimation = false;

statue = false;
Wall1 = noone;


color = c_white;
facing = 1;
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
bounce_coeff = 0.8;
bleed = noone;
bleedSprite = spBlood;
scaled = false; //Should we scale up to normal?
animate = false;
animate_dur = 1;
moving = true;
standing = noone;
image_speed = 0;

