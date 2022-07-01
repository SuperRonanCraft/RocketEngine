/// @desc ultimate damage amp spawned

owner = noone;

timer_org = 8 * room_speed;
timer = timer_org;
alpha_change = 0.02;
alpha_max = 0.8;
build_speed = (timer_org / room_speed) / 4;
build_per = -5;
build_per_max = 100;
image_alpha = 0;

placed = false;

rockets_amped = ds_list_create();