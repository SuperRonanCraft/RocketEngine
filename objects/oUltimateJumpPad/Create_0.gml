/// @desc JumpPad ult spawned

//Owner of the ultimate
owner = noone;

alpha_index = 0.025; //Change of alpha

//Uptime
timer_org = 12 * room_speed;
timer = timer_org;

//Placement
standing = false;
vsp = 0
grv = 0.2;

jump_list = ds_list_create();
jump_pwr = -10;

margin_x = 5;
margin_y = 5;

image_alpha = 1;