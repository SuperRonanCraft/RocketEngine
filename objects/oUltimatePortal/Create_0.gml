owner = noone;
first_step = false;
exit_x = 0;
exit_y = 0;
exit_created = false;
teleported = ds_list_create();
timer_org = 3 * room_speed; //placement time
timer = timer_org;
portal_timer = 100 * room_speed; //portal uptime
portal_alpha = 0;
portal_used_entry = false;
portal_used_exit = false;

//OTHER
marginx = sprite_width / 4;
marginy = sprite_height / 4;
image_alpha = 0;
max_alpha = 1;
alpha_change = 0.02;