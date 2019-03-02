/// @desc Turret ult spawned

//Owner of the ultimate
owner = noone;

alpha_index = 0.025; //Change of alpha

//Uptime
timer_org = 12 * room_speed;
timer = timer_org;
timer_len = 50;
timer_width = 3;
timer_margin = 2;

//Shooting
turret_rate = room_speed; //fire rate
turret_cd = turret_rate / 4; //current cooldown
turret_offset = 0;
turret_offset_max = 10;

//Health
turret_hp_org = 2; //Original health
turret_hp = turret_hp_org;
turret_hp_damaged = 0;
turret_hp_damaged_size = 1;
turret_hp_damaged_size_amt = 0.005;

//Placement
standing = false;
vsp = 0
grv = 0.2;

damaged_by = ds_list_create();

image_alpha = 1;