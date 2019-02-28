/// @desc Turret ult spawned

//Owner of the ultimate
owner = noone;

//Maximum alpha
alpha_max = 0.85; //Max opacity
alpha_index = 0.025; //Change of alpha

//Uptime
timer_org = 6 * room_speed;
timer = timer_org;

turret_rate = room_speed / 3; //fire rate
turret_cd = turret_rate; //current cooldown
turret_hp_org = 2;
turret_hp = turret_hp_org;

image_alpha = 1;