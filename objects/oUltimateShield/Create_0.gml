/// @desc Shield ult spawned

//Owner of the ultimate
owner = noone;
damage_toggle = false; //Ability to toggle damage

//Maximum alpha
alpha_max = 0.85;
alpha_index = 0.025;
color = c_aqua;
radius = 50; //Radius of shield
width_max = 10; //Width of shield
width = 0;

//Uptime
timer = 3 * room_speed;

fading = true;
fading_time = 30;
//false is fading in, true is out
fading_type = false;
//The alpha that we are at
fading_alpha = 0;