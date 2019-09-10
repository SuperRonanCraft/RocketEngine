//@desc pickup has spawned
timer_org = time * room_speed
timer = timer_org;
timer_current = irandom(timer);
delay = delayed * room_speed
delay_current = 0;
item = noone;

alpha_item = 0.8;
alpha_cooldown = 0;

item_scale = 1;
item_xoffset = 0;
item_yoffset = 0;

draw_offset = choose(2, 4, 6);

hacked = false;

image_index = irandom(image_number);

image_alpha = 0; //Hide by default
//instance_destroy(); //ENABLED :D
