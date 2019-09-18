/// @desc convert damage values to sprites

first_draw = false;
offset = 10;
value_damage = 0;
value_cached = []; //Sprites in an array

angle = 0;
angle_change = 1;
angle_side = choose(-1, 1);
alpha = 1;
alpha_reduce = 0.075 / TIME_SPEED;
speed_y = -(20 / TIME_SPEED);
speed_grv = 1.8 / TIME_SPEED;