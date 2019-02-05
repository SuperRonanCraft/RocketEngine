/// @desc Shield ult spawned

//Owner of the ultimate
owner = noone;
damage_toggle = false; //Ability to toggle damage

//Maximum alpha
alpha_max = 0.85; //Max opacity
alpha_index = 0.025; //Change of alpha per event
color = c_aqua;
//radius = sprite_width / 2; //Radius of shield
//width_max = 10; //Width of shield
//width = 0;

//Uptime
timer = 6 * room_speed;

fading = true;
fading_time = 30 * (room_speed / 30);
//false is fading in, true is out
fading_type = false;
//The alpha that we are at
image_alpha = 0;