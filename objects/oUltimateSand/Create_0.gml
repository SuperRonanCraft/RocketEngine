/// @desc Sand Ultimate created!

//Owner of the ultimate
owner = noone;

//Whether we checked the side
checked = false;
//False if left, right is true
side = false;
//Maximum alpha
alpha_max = 0.85;
alpha_index = 0.025;

//Cloud side set in Draw Begin method
xpos1 = 0;
xpos2 = 0;

//Uptime
timer = 10 * room_speed;

fading = true;
fading_time = 30;
//false is fading in, true is out
fading_type = false;
//The alpha that we are at
fading_alpha = 0;

depth -= 50;