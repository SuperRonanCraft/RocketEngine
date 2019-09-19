/// @desc ultimate brick wall spawned

owner = noone;

destroy = false;
timer_org = 10 * room_speed;
timer = timer_org;
alpha_change = 0.02;
alpha_max = 0.8;
build_speed = room_speed / 2;
build_at_offset = 10;
build_at_offset_crt = 10;
build_at = 1;
walls_tospawn = 0;
walls_spawned = ds_list_create();
walls_side = 0;
walls_thickness = 2;
image_alpha = 0;

placed = false;
first_step = false;

//Shake wall
/*shake_lenght = 0;
shake_magnitude = 0;
shake_remain = 0;