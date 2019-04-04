/// @desc Frosty ult spawned

owner = noone;
hsp = 0;
vsp = -2;
grv = 0.6;
hsp_max = 25; //max hsp
touching_floor = false;
frc = 0.1;
freezing = true;

timer = 10 * room_speed; //ice cube ult time
alpha_change = 0.05;

particle_amt = 4;
particle_crt = 0;

frozen_walls = ds_list_create(); //list of maps
frozen_walls_uptime = 5 * room_speed;

image_xscale = 1;